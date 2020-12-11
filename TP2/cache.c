
#include "cache.h"
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define TAMANIO_MEMORIA_PRINCIPAL (64*1024)
// |tag|index|offset|
// offset -> log2(tamanio_bloque);
// index -> log2(cantidad_conjuntos)
// tag -> 16 - offset - index
//  Via1    Via2
//1|TO |   |TO |
//2|TO |   |TO |

typedef struct main_memory{
  char data[TAMANIO_MEMORIA_PRINCIPAL];
}main_memory_t;

main_memory_t main_memory;

void update_lru(int index,int way){
  unsigned int lru_block = cache.blocks[index][way].lru;
  for(int i = 0; i < cache.ways; i++){
    if(i!=way && (cache.blocks[index][i].lru < lru_block)){
        cache.blocks[index][i].lru++;
    }
  }
  cache.blocks[index][way].lru = 1;
}

void init(){
  cache.misses = 0;
  cache.hits = 0;
  memset(&main_memory,0,sizeof(main_memory));

  for(int i=0;i<cache.sets;i++){
    for(int j=0;j<cache.ways;j++){
      cache.blocks[i][j].valid = false;
    }
  }
}

/* La función find set(int address) debe devolver el conjunto de caché al que mapea la dirección address.
 */
unsigned int find_set(int address){
  return (address / cache.blocksize) % cache.sets; // La division seria como >>
}

/* La función find lru(int setnum) debe devolver el bloque menos recientemente usado dentro de un conjunto (o alguno de ellos si hay más
 * de uno), utilizando el campo correspondiente de los metadatos de los
 * bloques del conjunto.
 */
unsigned int find_lru(int setnum){
  int highest_lru = 0;
  unsigned int lru_block = 0;
  for(int i = 0;i<cache.ways; i++){
      if(cache.blocks[setnum][i].lru>highest_lru){
          highest_lru = cache.blocks[setnum][i].lru;
          lru_block = i;
      }
  }

  return lru_block;
}

/* La función is dirty(int way, int setnum) debe devolver el estado del bit D del bloque correspondiente.
 */
unsigned int is_dirty(int way,int setnum){
  return (unsigned int)cache.blocks[setnum][way].dirty;
}

/* La función read block(int blocknum) debe leer el bloque blocknum
 * de memoria y guardarlo en el lugar que le corresponda en la memoria
 * caché.
 */
void read_block(int blocknum){
  int first_address = blocknum*cache.blocksize;
  int set = find_set(first_address);
  int way = find_lru(set);
  if(is_dirty(way,set)){
    write_block(way,set);
  }
  for(int i = 0; i<cache.blocksize ;i++){
    cache.blocks[set][way].data[i] = main_memory.data[first_address + i];
  }
  cache.blocks[set][way].dirty = false;
  cache.blocks[set][way].valid = true;
  cache.blocks[set][way].lru = 1;
}

/* La función write block(int way, int setnum) debe escribir en memoria
 * los datos contenidos en el bloque setnum de la vı́a way.
 */
void write_block(int way, int setnum){
  if(!is_dirty(way,setnum)){//REVISAR SI SE SACA O NO
    return;
  }

  int address =((cache.blocks[setnum][way].tag << (int)(log(cache.sets)/log(2))) | setnum) * cache.blocksize;

  for(int i=0; i<cache.blocksize; i++){
    main_memory.data[address+i] = cache.blocks[setnum][way].data[i];
  }

}

/* La función read byte(address) debe retornar el valor correspondiente
 * a la posición de memoria address, buscándolo primero en el caché.
 */
char read_byte(int address){ //address tiene tag/setnum/offset -> buscamos en cache -> hit/miss -> buscar en memoria_principal
                             // si esta en memoria principal -> llamamos a read_block JOAQUIN GIL

  int tag = address >> (int)(16 - log(cache.blocksize)/log(2) - log(cache.sets)/log(2));

  int index = address << (int)(16 - log(cache.blocksize)/log(2) - log(cache.sets)/log(2));
  index = index >>  (int)(16 - log(cache.sets)/log(2));

  int offset = address << (int)(16 - log(cache.blocksize)/log(2));
  offset = offset >> (int)(16 - log(cache.blocksize)/log(2));

  int way =0;
  cache.was_hit = false;
  while(way < cache.ways && !cache.was_hit){
    if(cache.blocks[index][way].tag == tag && cache.blocks[index][way].valid){
      cache.was_hit = true;
      cache.hits++;
    }
    else{
      way++;
    }
  }

  if(cache.was_hit){
    update_lru(index,way);
    return cache.blocks[index][way].data[offset];
  }

  cache.misses++;
  way = find_lru(index);
  read_block(address/cache.blocksize);

  return cache.blocks[index][way].data[offset];
}

/* La función write byte(int address, char value) debe escribir el
 * valor value en la posición correcta del bloque que corresponde a
 * address
 */
void write_byte(int address, char value){
  int tag = address >> (int)(16 - log(cache.blocksize)/log(2) - log(cache.sets)/log(2));

  int index = address << (int)(16 - log(cache.blocksize)/log(2) - log(cache.sets)/log(2));
  index = index >>  (int)(16 - log(cache.sets)/log(2));

  int offset = address << (int)(16 - log(cache.blocksize)/log(2));
  offset = offset >> (int)(16 - log(cache.blocksize)/log(2));

  int way = 0;
  cache.was_hit = false;
  while(way < cache.ways && !cache.was_hit){
    if(cache.blocks[index][way].tag == tag && cache.blocks[index][way].valid){
      cache.was_hit = true;
      cache.hits++;
    }
    else{
      way++;
    }
  }

  if(cache.was_hit){
    update_lru(index,way);
    cache.blocks[index][way].data[offset] = value;
    return;
  }

  cache.misses++;
  way = find_lru(index);
  read_block(address/cache.blocksize);

  cache.blocks[index][way].data[offset] = value;
}

/* La función get miss rate() debe devolver el porcentaje de misses desde que se inicializó el cache.
 */
int get_miss_rate(){
  int total = cache.misses+cache.hits;
  if(total == 0){
    return 0;
  }
  return (cache.misses*100)/(total);
}

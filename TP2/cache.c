#include "cache.h"
#include <string.h>
#include <math.h>
#define KILOBYTE 1024
#define ERROR -1

typedef struct main_memory{
  unsigned char data[TAMANIO_MEMORIA_PRINCIPAL];
}main_memory_t;

typedef struct block{
  unsigned int lru;
  bool dirty;
  bool valid;
  unsigned int tag;
  unsigned char* data;
}block_t;

typedef struct cache{
  bool was_hit;
  unsigned int misses;
  unsigned int hits;
  unsigned int cachesize;
  unsigned int blocksize;
  unsigned int ways;
  unsigned int sets;
  block_t** blocks;
}cache_t;

cache_t cache;
main_memory_t main_memory;
/////------------------------------AUX------------------------------/////

void update_lru(unsigned int index,unsigned int way){
  for(int i = 0; i < cache.ways; i++){
    if(i!=way){
        cache.blocks[index][i].lru++;
    }
  }
  cache.blocks[index][way].lru = 0;
}

unsigned short getTag(unsigned int address){
  unsigned short offset_bits = ceil(log(cache.blocksize)/log(2));
  unsigned short index_bits = ceil(log(cache.sets)/log(2));
  unsigned short shift_size  = (offset_bits + index_bits);
  return address >> shift_size;
}

unsigned short getOffset(unsigned int address){
  unsigned short offset_bits = ceil(log(cache.blocksize)/log(2));
  unsigned short offset = address << (BITS_DIRECCION - offset_bits);
  offset = offset >> (BITS_DIRECCION - offset_bits);
  return offset;
}

unsigned short getAddress(unsigned int way,unsigned int setnum){
  unsigned short index_bits = ceil(log(cache.sets)/log(2));
  unsigned short shifted_tag = cache.blocks[setnum][way].tag << index_bits;
  return (shifted_tag | setnum) * cache.blocksize;
}

int search_in_cache(unsigned int index,unsigned int tag){
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
  return way;
}

int set_up_cache(configuracion_t configuracion){
  cache.cachesize = configuracion.tamanioCache * KILOBYTE;
  cache.blocksize = configuracion.tamanioBloque;
  cache.ways = configuracion.vias;
  cache.sets = cache.cachesize/(cache.ways*cache.blocksize);

  cache.blocks = calloc(cache.sets,sizeof(block_t*));
  if(cache.blocks == NULL){
    fprintf(stderr, "Ocurrio un error al alocar la memoria.\n");
    return ERROR;
  }

  for(int i=0;i<cache.sets;i++){
    cache.blocks[i] = calloc(cache.ways,sizeof(block_t));
    if(cache.blocks[i] == NULL){
      fprintf(stderr, "Ocurrio un error al alocar la memoria.\n");
      return ERROR;
    }
  }

  for(int i=0;i<cache.sets;i++){
    for(int j=0;j<cache.ways;j++){
      cache.blocks[i][j].data = calloc(cache.blocksize,sizeof(char));
      if(cache.blocks[i][j].data == NULL){
        fprintf(stderr, "Ocurrio un error al alocar la memoria.\n");
        return ERROR;
      }
    }
  }
  return 0;
}

void destroy_cache(){
  for(int i=0;i<cache.sets;i++){
    for(int j=0;j<cache.ways;j++){
      free(cache.blocks[i][j].data);
    }
  }

  for(int i=0;i<cache.sets;i++){
    free(cache.blocks[i]);
  }
  free(cache.blocks);
}

bool was_hit(){
  return cache.was_hit;
}

/////------------------------------MAIN------------------------------/////


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
unsigned int find_set(unsigned int address){
  unsigned short offset_bits = ceil(log(cache.blocksize)/log(2));
  unsigned short index_bits = ceil(log(cache.sets)/log(2));
  unsigned short tag_bits = (BITS_DIRECCION - offset_bits - index_bits);
  unsigned short index = address << tag_bits;
  index = index >> (offset_bits + tag_bits) ;
  return index;
}


/* La función find lru(int setnum) debe devolver el bloque menos recientemente usado dentro de un conjunto (o alguno de ellos si hay más
 * de uno), utilizando el campo correspondiente de los metadatos de los
 * bloques del conjunto.
 */
unsigned int find_lru(unsigned int setnum){
  int highest_lru = 0, i = 0;
  unsigned int lru_block = 0;
  bool found = false;
  while(i<cache.ways && !found){
      if(!cache.blocks[setnum][i].valid){
        lru_block = i;
        found = true;
      }else if(cache.blocks[setnum][i].lru>highest_lru && cache.blocks[setnum][i].valid){
        highest_lru = cache.blocks[setnum][i].lru;
        lru_block = i;
      }
      i++;
  }
  return lru_block;
}


/* La función is dirty(int way, int setnum) debe devolver el estado del bit D del bloque correspondiente.
 */
unsigned int is_dirty(unsigned int way,unsigned int setnum){
  return (unsigned int)cache.blocks[setnum][way].dirty;
}


/* La función read block(int blocknum) debe leer el bloque blocknum
 * de memoria y guardarlo en el lugar que le corresponda en la memoria
 * caché.
 */
void read_block(unsigned int blocknum){
  int first_address = blocknum*cache.blocksize;
  int set = find_set(first_address);
  int way = find_lru(set);
  if(is_dirty(way,set)){
    write_block(way,set);
  }
  for(int i = 0; i<cache.blocksize; i++){
    cache.blocks[set][way].data[i] = main_memory.data[first_address + i];
  }
  cache.blocks[set][way].dirty = false;
  cache.blocks[set][way].valid = true;
  cache.blocks[set][way].lru = 0;
}


/* La función write block(int way, int setnum) debe escribir en memoria
 * los datos contenidos en el bloque setnum de la vı́a way.
 */
void write_block(unsigned int way,unsigned int setnum){
  if(!is_dirty(way,setnum)){
    return;
  }
  unsigned int address = getAddress(way,setnum);

  for(int i=0; i<cache.blocksize; i++){
    main_memory.data[address+i] = cache.blocks[setnum][way].data[i];
  }
}


/* La función read byte(address) debe retornar el valor correspondiente
 * a la posición de memoria address, buscándolo primero en el caché.
 */
unsigned char read_byte(unsigned int address){
  unsigned short tag = getTag(address);
  unsigned short index = find_set(address);
  unsigned short offset = getOffset(address);
  unsigned int way = search_in_cache(index,tag);

  if(cache.was_hit){
    update_lru(index,way);
    return cache.blocks[index][way].data[offset];
  }

  cache.misses++;
  way = find_lru(index);
  read_block(address/cache.blocksize);
  cache.blocks[index][way].tag = tag;
  update_lru(index,way);
  return cache.blocks[index][way].data[offset];
}


/* La función write byte(int address, char value) debe escribir el
 * valor value en la posición correcta del bloque que corresponde a
 * address
 */
void write_byte(unsigned int address,unsigned char value){
  unsigned int tag = getTag(address);
  unsigned int index = find_set(address);
  unsigned int offset = getOffset(address);
  unsigned int way = search_in_cache(index,tag);

  if(cache.was_hit){
    update_lru(index,way);
    cache.blocks[index][way].dirty = true;
    cache.blocks[index][way].data[offset] = value;
    return;
  }

  cache.misses++;
  way = find_lru(index);
  read_block(address/cache.blocksize);
  cache.blocks[index][way].tag = tag;
  update_lru(index,way);
  cache.blocks[index][way].dirty = true;
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

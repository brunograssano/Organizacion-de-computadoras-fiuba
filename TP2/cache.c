
#include "cache.h"
#include <stdlib.h>
#include <math.h>

const int TAMANIO_MEMORIA_PRINCIPAL = (64*1024);
// |tag|index|offset|
// offset -> log2(tamanio_bloque);
// index -> log2(cantidad_conjuntos)
// tag -> 16 - offset - index
//  Via1    Via2
//1|TO |   |TO |
//2|TO |   |TO |

typedef struct memoria_principal{
  char datos[TAMANIO_MEMORIA_PRINCIPAL];
}memoria_principal_t

typedef struct bloque{
  unsigned int lru;
  bool dirty;
  bool valid;
  unsigned int tag;
  char datos[tamanio_bloque];
}bloque_t;

typedef struct cache{
  unsigned int misses;
  unsigned int hits;
  unsigned int tamanio_cache;
  unsigned int tamanio_bloque;
  unsigned int vias;
  unsigned int cantidad_conjuntos;
  bloque_t bloques[cantidad_conjuntos][vias]
}cache_t;


cache_t cache;
memoria_principal_t memoria_principal;

void init(){
  cache.misses = 0;
  cache.hits = 0;
  memset(cache.bloques,0,sizeof(cache.bloques));
  memset(&memoria_principal,0,sizeof(memoria_principal_t));
}

/* La función find set(int address) debe devolver el conjunto de caché al que mapea la dirección address.
 */
unsigned int find_set(int address){
  return (address / cache.tamanio_bloque) % cache.cantidad_conjuntos; // La division seria como >>
}

/* La función find lru(int setnum) debe devolver el bloque menos recientemente usado dentro de un conjunto (o alguno de ellos si hay más
 * de uno), utilizando el campo correspondiente de los metadatos de los
 * bloques del conjunto.
 */
unsigned int find_lru(int setnum){
  int lru_mas_alto = 0;
  unsigned int bloque_lru_en_via = 0;
  for(int i = 0;i<cache.vias; i++){
      if(cache.bloques[setnum][i].lru>lru_mas_alto){
          lru_mas_alto = cache.bloques[setnum][i].lru;
          bloque_lru_en_via = i;
      }
  }

  return bloque_lru_en_via;
}

/* La función is dirty(int way, int setnum) debe devolver el estado del bit D del bloque correspondiente.
 */
unsigned int is_dirty(int way,int setnum){
  return cache.bloques[setnum][way].dirty;
}

/* La función read block(int blocknum) debe leer el bloque blocknum
 * de memoria y guardarlo en el lugar que le corresponda en la memoria
 * caché.
 */
void read_block(int blocknum){
  int comienzo_direccion = blocknum*cache.tamanio_bloque;
  int conjunto = find_set(comienzo_direccion);
  int via = find_lru(conjunto);
  if(is_dirty(via,conjunto)){
    write_block(via,conjunto);
  }
  for(int i = 0; i<cache.tamanio_bloque ;i++){
    cache.bloques[conjunto][via].datos[i] = memoria_principal.datos[comienzo_direccion + i];
  }
  cache.bloques[conjunto][via].dirty = false;
  cache.bloques[conjunto][via].valid = true;
  cache.bloques[conjunto][via].lru = 1;
}

/* La función write block(int way, int setnum) debe escribir en memoria
 * los datos contenidos en el bloque setnum de la vı́a way.
 */
void write_block(int way, int setnum){
  if(!is_dirty(way,setnum)){//REVISAR SI SE SACA O NO
    return;
  }

  // (tag|setnum(index) ->numeroBloqueEnMem) * tamanio_bloque


  int direccion =((cache.bloques[setnum][way].tag << (log(cantidad_conjuntos)/log(2))) | setnum) * cache.tamanio_bloque;

  for(int i=0; i<cache.tamanio_bloque; i++){
    memoria_principal.datos[direccion+i] = cache.bloques[setnum][way].datos[i];
  }

}

/* La función read byte(address) debe retornar el valor correspondiente
 * a la posición de memoria address, buscándolo primero en el caché.
 */
char read_byte(int address){ //address tiene tag/setnum/offset -> buscamos en cache -> hit/miss -> buscar en memoria_principal
                             // si esta en memoria principal -> llamamos a read_block JOAQUIN GIL

  int tag = address >> (16 - log(cache.tamanio_bloque)/log(2) - log(cache.cantidad_conjuntos)/log(2));

  int index = address << (16 - log(cache.tamanio_bloque)/log(2) - log(cache.cantidad_conjuntos)/log(2));
  index = index >>  (16 - log(cache.cantidad_conjuntos)/log(2));

  int offset = address << (16 - log(cache.tamanio_bloque)/log(2));
  offset = offset >> (16 - log(cache.tamanio_bloque)/log(2));

  int via =0;
  bool encontre_el_bloque = false;
  while(via < cache.vias && !encontre_el_bloque){
    if(cache.bloques[index][via].tag == tag && cache.bloques[index][via].valid){
      encontre_el_bloque = true;
      cache.hits++;
    }
    else{
      via++;
    }
  }

  if(encontre_el_bloque){
    actualizar_lru(index,via);
    return cache.bloques[index][via].datos[offset];
  }

  cache.misses++;
  via = find_lru(index);
  read_block(address/cache.tamanio_bloque);

  return cache.bloques[index][via].datos[offset];
}

/* La función write byte(int address, char value) debe escribir el
 * valor value en la posición correcta del bloque que corresponde a
 * address
 */
void write_byte(int address, char value){
  int tag = address >> (16 - log(cache.tamanio_bloque)/log(2) - log(cache.cantidad_conjuntos)/log(2));

  int index = address << (16 - log(cache.tamanio_bloque)/log(2) - log(cache.cantidad_conjuntos)/log(2));
  index = index >>  (16 - log(cache.cantidad_conjuntos)/log(2));

  int offset = address << (16 - log(cache.tamanio_bloque)/log(2));
  offset = offset >> (16 - log(cache.tamanio_bloque)/log(2));

  int via =0;
  bool encontre_el_bloque = false;
  while(via < cache.vias && !encontre_el_bloque){
    if(cache.bloques[index][via].tag == tag && cache.bloques[index][via].valid){
      encontre_el_bloque = true;
      cache.hits++;
    }
    else{
      via++;
    }
  }

  if(encontre_el_bloque){
    actualizar_lru(index,via);
    cache.bloques[index][via].datos[offset] = value;
    return;
  }

  cache.misses++;
  via = find_lru(index);
  read_block(address/cache.tamanio_bloque);

  cache.bloques[index][via].datos[offset] = value;
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



void actualizar_lru(int index,int via){
  unsigned int lru_bloque = cache.bloques[index][via].lru;
  for(int i = 0; i < cache.vias; i++){
    if(i!=via && (cache.bloques[index][i].lru < lru_bloque)){
        cache.bloques[index][i].lru++;
    }
  }
  cache.bloques[index][via].lru = 1;
}

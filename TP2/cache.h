#ifndef __CACHE_H__
#define __CACHE_H__

#include <stdbool.h>

typedef struct block{
  unsigned int lru;
  bool dirty;
  bool valid;
  unsigned int tag;
  char* data;
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

void init();

unsigned int find_set(int address);

unsigned int find_lru(int setnum);

unsigned int is_dirty(int way,int setnum);

void read_block(int blocknum);

void write_block(int way, int setnum);

char read_byte(int address);

void write_byte(int address, char value);

int get_miss_rate();



#endif /* __CACHE_H__ */

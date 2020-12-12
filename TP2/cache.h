#ifndef __CACHE_H__
#define __CACHE_H__

#include <stdbool.h>

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

void init();

unsigned int find_set(unsigned int address);

unsigned int find_lru(unsigned int setnum);

unsigned int is_dirty(unsigned int way,unsigned int setnum);

void read_block(unsigned int blocknum);

void write_block(unsigned int way,unsigned int setnum);

unsigned char read_byte(unsigned int address);

void write_byte(unsigned int address,unsigned char value);

int get_miss_rate();



#endif /* __CACHE_H__ */

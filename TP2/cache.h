#ifndef __CACHE_H__
#define __CACHE_H__

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define TAMANIO_MEMORIA_PRINCIPAL (64*1024)
#define BITS_DIRECCION 16

typedef struct configuracion{
  bool pidioOtraOpcion;
  int vias;
  int tamanioCache;
  int tamanioBloque;
  FILE* salida;
}configuracion_t;

int set_up_cache(configuracion_t configuracion);

void destroy_cache();

bool was_hit();

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

#include "cache.h"
#include "mi_assert.h"
#define ERROR -1

int sePideCacheSinAccesosDevuelveCero(int* contadorTotales){
  int contadorSuperadas = 0;
  configuracion_t configuracion = {false,2,4,32,NULL};
  if(set_up_cache(configuracion)==ERROR){
    return contadorSuperadas;
  }
  init();

  assert(get_miss_rate()==0,"El miss rate inicial es de 0",contadorSuperadas);
  (*contadorTotales)++;
  destroy_cache();
  return contadorSuperadas;
}

int alPedirUbicacionesDelCacheSinUsoTodasEstanLimpias(int* contadorTotales){
  int contadorSuperadas = 0;
  configuracion_t configuracion = {false,4,4,32,NULL};
  if(set_up_cache(configuracion)==ERROR){
    return contadorSuperadas;
  }
  init();

  assert(!is_dirty(3,2),"Esta limpio el bloque del conjunto 2 y via 3",contadorSuperadas);
  (*contadorTotales)++;
  assert(!is_dirty(1,4),"Esta limpio el bloque del conjunto 4 y via 1",contadorSuperadas);
  (*contadorTotales)++;
  assert(!is_dirty(2,3),"Esta limpio el bloque del conjunto 3 y via 2",contadorSuperadas);
  (*contadorTotales)++;
  assert(!is_dirty(1,1),"Esta limpio el bloque del conjunto 1 y via 1",contadorSuperadas);
  (*contadorTotales)++;
  destroy_cache();
  return contadorSuperadas;
}

int alPedirElLRUAlComienzoDevuelveLosBloquesSinUso(int* contadorTotales){
  int contadorSuperadas = 0;
  configuracion_t configuracion = {false,2,2,1,NULL};
  if(set_up_cache(configuracion)==ERROR){
    return contadorSuperadas;
  }
  init();

  assert(find_lru(0)==0,"Devolvio el bloque 0 del primer conjunto",contadorSuperadas);
  (*contadorTotales)++;
  write_byte(0,'A');

  assert(find_lru(0)==1,"Devolvio el bloque 1 del primer conjunto",contadorSuperadas);
  (*contadorTotales)++;
  write_byte(1,'S');

  int conjunto = find_set(32);
  assert(find_lru(conjunto)==0,"Devolvio el bloque 0 de otro conjunto",contadorSuperadas);
  (*contadorTotales)++;
  write_byte(32,'D');

  assert(find_lru(conjunto)==1,"Devolvio el bloque 1 del otro conjunto",contadorSuperadas);
  (*contadorTotales)++;
  write_byte(4128,'U'); // mapea al mismo conjunto que el 32
  write_byte(4128,'d');
  write_byte(4128,'g');

  assert(find_lru(conjunto)==0,"Se usa un bloque y se pide el LRU, devuelve el 0",contadorSuperadas);
  (*contadorTotales)++;

  destroy_cache();
  return contadorSuperadas;
}

int escriboBytesEnDiferentesPosicionesYAlPedirlosLosDevuelve(int* contadorTotales){
  int contadorSuperadas = 0;
  configuracion_t configuracion = {false,4,4,1,NULL};
  if(set_up_cache(configuracion)==ERROR){
    return contadorSuperadas;
  }
  init();

  write_byte(0x0,'A');
  write_byte(0x2,'B');
  write_byte(0x4,'C');
  write_byte(0x6,'D');
  write_byte(0x8,'E');

  assert(read_byte(0x0)=='A',"Devolvio el caracter esperado (A)",contadorSuperadas);
  (*contadorTotales)++;

  assert(read_byte(0x2)=='B',"Devolvio el caracter esperado (B)",contadorSuperadas);
  (*contadorTotales)++;

  assert(read_byte(0x4)=='C',"Devolvio el caracter esperado (C)",contadorSuperadas);
  (*contadorTotales)++;

  assert(read_byte(0x6)=='D',"Devolvio el caracter esperado (D)",contadorSuperadas);
  (*contadorTotales)++;

  assert(read_byte(0x8)=='E',"Devolvio el caracter esperado (E)",contadorSuperadas);
  (*contadorTotales)++;

  write_byte(0x0,'H');
  assert(read_byte(0x0)=='H',"Devolvio el caracter esperado al remplazar un valor (H)",contadorSuperadas);
  (*contadorTotales)++;

  write_byte(0x8,'W');
  assert(read_byte(0x8)=='W',"Devolvio el caracter esperado al remplazar un valor (W)",contadorSuperadas);
  (*contadorTotales)++;

  assert(get_miss_rate()==35,"El miss rate devuelto es el esperado (35)",contadorSuperadas);
  (*contadorTotales)++;
  destroy_cache();
  return contadorSuperadas;
}

int seVaModificandoLaCacheYPidiendoElMissRate(int* contadorTotales){
  int contadorSuperadas = 0;
  configuracion_t configuracion = {false,1,16,32,NULL};
  if(set_up_cache(configuracion)==ERROR){
    return contadorSuperadas;
  }
  init();

  write_byte(0,'E'); //MISS
  assert(get_miss_rate()==100,"Devolvio el miss rate esperado (100)",contadorSuperadas);
  (*contadorTotales)++;
  assert(!was_hit(),"Fue miss",contadorSuperadas);
  (*contadorTotales)++;

  write_byte(1,'a'); //HIT
  assert(get_miss_rate()==50,"Devolvio el miss rate esperado (50)",contadorSuperadas);
  (*contadorTotales)++;
  assert(was_hit(),"Fue hit",contadorSuperadas);
  (*contadorTotales)++;
  assert(is_dirty(0,find_set(1)),"Esta marcado como dirty al escribir",contadorSuperadas);
  (*contadorTotales)++;

  assert(!is_dirty(0,find_set(32)),"Esta limpio el bloque de la direccion 32",contadorSuperadas);
  (*contadorTotales)++;
  write_byte(32,'R'); //MISS
  assert(get_miss_rate()==66,"Devolvio el miss rate esperado (66)",contadorSuperadas);
  (*contadorTotales)++;
  assert(!was_hit(),"Fue miss",contadorSuperadas);
  (*contadorTotales)++;
  assert(is_dirty(0,find_set(32)),"Esta dirty el bloque de la direccion 32",contadorSuperadas);
  (*contadorTotales)++;

  write_byte(64,'y'); //MISS
  assert(get_miss_rate()==75,"Devolvio el miss rate esperado (75)",contadorSuperadas);
  (*contadorTotales)++;
  assert(!was_hit(),"Fue miss",contadorSuperadas);
  (*contadorTotales)++;

  write_byte(66,'7'); //HIT
  assert(get_miss_rate()==60,"Devolvio el miss rate esperado (60)",contadorSuperadas);
  (*contadorTotales)++;
  assert(was_hit(),"Fue hit",contadorSuperadas);
  (*contadorTotales)++;

  write_byte(120,'1'); //MISS
  write_byte(1024,'2'); //MISS
  write_byte(2048,'3'); //MISS
  write_byte(2400,'4'); //MISS
  write_byte(2300,'5'); //MISS
  assert(get_miss_rate()==80,"Devolvio el miss rate esperado (80)",contadorSuperadas);
  (*contadorTotales)++;

  destroy_cache();
  return contadorSuperadas;
}

int main(){
  int contadorSuperadas = 0,contadorTotales = 0;

  contadorSuperadas += sePideCacheSinAccesosDevuelveCero(&contadorTotales);
  contadorSuperadas += alPedirUbicacionesDelCacheSinUsoTodasEstanLimpias(&contadorTotales);
  contadorSuperadas += alPedirElLRUAlComienzoDevuelveLosBloquesSinUso(&contadorTotales);
  contadorSuperadas += escriboBytesEnDiferentesPosicionesYAlPedirlosLosDevuelve(&contadorTotales);
  contadorSuperadas += seVaModificandoLaCacheYPidiendoElMissRate(&contadorTotales);

  verificar_si_paso_las_pruebas(contadorSuperadas,contadorTotales);
}

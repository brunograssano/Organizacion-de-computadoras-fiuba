CC=gcc
CFLAGS = -g -std=c99 -Wall -Werror
CFLAGS += -Wbad-function-cast
CFLAGS += -Wtype-limits -Wshadow -Wno-unused-variable
CFLAGS += -Wpointer-arith -Wunreachable-code -Wformat=2
CFLAGS += -pedantic

tp: main.c cache.c cache.h
		$(CC) $(CFLAGS) main.c cache.c -o tp -lm

test: cache.c cache.h tests.c mi_assert.c mi_assert.h
		$(CC) $(CFLAGS) tests.c cache.c  mi_assert.c -o tests -lm

.PHONY : clean

clean:
	rm -f tp
	rm *.o

CC=gcc
CFLAGS = -g -std=c99 -Wall -Werror
CFLAGS += -Wbad-function-cast
CFLAGS += -Wtype-limits -Wshadow -Wno-unused-variable
CFLAGS += -Wpointer-arith -Wunreachable-code -Wformat=2
CFLAGS += -pedantic

tp: main.c cache.c cache.h
		$(CC) $(CFLAGS) *.c -o tp -lm


.PHONY : clean

clean:
	rm -f tp
	rm *.o

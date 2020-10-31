CC=gcc
CFLAGS=-g -std=c99 -Wall -Werror -o0

tp: main.c base64.c
	$(CC) $(CFLAGS) *.c -o tp


.PHONY : clean

clean:
	rm -f tp
	rm *.o

CC=gcc
CFLAGS=-g -std=c99 -Wall -Werror -o0

tp: conversionBase64.c
	$(CC) $(CFLAGS) -c conversionBase64.c -o tp


.PHONY : clean

clean:
	rm -f tp
	rm *.o

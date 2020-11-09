CC=gcc
CFLAGS = -g -std=c99 -Wall -Werror
CFLAGS += -Wbad-function-cast
CFLAGS += -Wtype-limits -Wshadow -Wno-unused-variable
CFLAGS += -Wpointer-arith -Wunreachable-code -Wformat=2
CFLAGS += -pedantic

UNAME = $(shell uname -m)

tp: main.c euclides.c euclides.h mcd.S mcm.S
ifeq ($(UNAME),x86_64)
		$(CC) $(CFLAGS) *.c -o tp
else
		$(CC) $(CFLAGS) *.c *.S -DUSE_MIPS -o tp
endif

.PHONY : clean

clean:
	rm -f tp
	rm *.o

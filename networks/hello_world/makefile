LANGUAGE=CHINESE

CC=cc
CFLAGS=-Wall -Werror -g

all: hello-world international-hello-world fancy-hello-world

fancy-hello-world: fancy-hello-world.o
	$(CC) $(CFLAGS) -o fancy-hello-world fancy-hello-world.o

fancy-hello-world.o: fancy-hello-world.c
	$(CC) $(CFLAGS) -c fancy-hello-world.c

hello-world: hello-world.o
	$(CC) $(CFLAGS) -o hello-world hello-world.o

hello-world.o: hello-world.c
	$(CC) $(CFLAGS) -c hello-world.c

international-hello-world: international-hello-world.o
	$(CC) $(CFLAGS) -o international-hello-world international-hello-world.o

international-hello-world.o: international-hello-world.c
	$(CC) $(CFLAGS) -c international-hello-world.c -D$(LANGUAGE) -o international-hello-world.o


clean:
	rm -f hello-world.o international-hello-world.o fancy-hello-world.o hello-world international-hello-world fancy-hello-world
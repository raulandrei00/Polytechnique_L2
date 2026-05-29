LANGUAGE=ENGLISH

all: hello-world international-hello-world fancy-hello-world

hello-world: hello-world.o
	cc -Wall -g -o hello-world hello-world.o

hello-world.o: hello-world.c hello-world.h
	cc -Wall -g -c hello-world.c

international-hello-world: international-hello-world.o
	cc -Wall -g -o international-hello-world international-hello-world.o

international-hello-world.o: international-hello-world.c international-hello-world.h
	cc -Wall -g -c international-hello-world.c -D$(LANGUAGE)

fancy-hello-world: fancy-hello-world.o
	cc -Wall -g -o fancy-hello-world fancy-hello-world.o

fancy-hello-world.o: fancy-hello-world.c fancy-hello-world.h
	cc -Wall -g -c fancy-hello-world.c

clean:
	rm -f hello-world hello-world.o international-hello-world international-hello-world.o fancy-hello-world fancy-hello-world.o
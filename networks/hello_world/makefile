LANGUAGE=ROMANIAN

CC=cc
CFLAGS=-Wall -g

INTL_OBJ=international-hello-world-$(LANGUAGE).o

all: hello-world international-hello-world fancy-hello-world

fancy-hello-world: fancy-hello-world.o
	$(CC) $(CFLAGS) -o fancy-hello-world fancy-hello-world.o

fancy-hello-world.o: fancy-hello-world.c
	$(CC) $(CFLAGS) -c fancy-hello-world.c

hello-world: hello-world.o
	$(CC) $(CFLAGS) -o hello-world hello-world.o

hello-world.o: hello-world.c
	$(CC) $(CFLAGS) -c hello-world.c

international-hello-world: $(INTL_OBJ)
	$(CC) $(CFLAGS) -o international-hello-world $(INTL_OBJ)

$(INTL_OBJ): international-hello-world.c
	$(CC) $(CFLAGS) -c international-hello-world.c -D$(LANGUAGE) -o $(INTL_OBJ)

.PHONY: all clean

# used regex rule to clean all object files generated
clean:
	rm -f *hello-world*.o hello-world international-hello-world fancy-hello-world
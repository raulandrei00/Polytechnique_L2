
all: client server fancyclient


client: client.o
	$(CC) $(CFLAGS) -o client client.o

server: server.o
	$(CC) $(CFLAGS) -o server server.o

client.o: client.c
	$(CC) $(CFLAGS) -c client.c

server.o: server.c
	$(CC) $(CFLAGS) -c server.c
	
fancyclient: fancyclient.o
	$(CC) $(CFLAGS) -o fancyclient fancyclient.o

fancyclient.o: fancyclient.c
	$(CC) $(CFLAGS) -c fancyclient.c


clean:
	rm -f *.o client server fancyclient echoserver
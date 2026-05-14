REBUILDABLES = client server client.o server.o

all : client server

client : client.o
	cc -g -o $@ $^ 

server : server.o
	cc -g -o $@ $^ 

%.o : %.c
	cc -g -Wall -o $@ -c $<

clean: 
	rm -f $(REBUILDABLES)

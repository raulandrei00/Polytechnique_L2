Tic-Tac-Toe over UDP -- Client and Server



The client (implemented in client.c, executable "client") and the server (server.c resp server) communicate over UDP, exchanging the
binary messages defined in the assignment specification:

    FYI 0x01   MYM 0x02   END 0x03   TXT 0x04   MOV 0x05   LFT 0x06

The client-server ensamble are compiled into the two executables by "make"

To build them individually:

    make client
    make server

Or directly, without make:

    gcc -Wall -Wextra -g -o client client.c
    gcc -Wall -Wextra -g -o server server.c

To remove the generated files:

    make clean


Running from the command line

1. Start the server, giving it a port number to listen on
   

       ./server 5000

2. Start two clients, giving each the server's IP address and the
   same port. On the same machine, use 127.0.0.1:

       ./client 127.0.0.1 5000
       ./client 127.0.0.1 5000

   The first client to connect is player 1 (X); the second is
   player 2 (O). Any further client that tries to connect while the
   game is in progress is told the game is full and exits.

3. Play. When the server asks a client to move ("Make Your Move"),
   the client prompts for a column (0-2) and a row (0-2). The board
   is displayed after every move. When the game ends, both clients
   announce the winner (or a draw) and terminate.

Note: I would have put common defines and function definitions in a separate header file,
but since it was not in the project spec, I decided to not do that 

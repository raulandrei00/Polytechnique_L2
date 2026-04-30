make builds the executable wgetX

running wgetX:
$ ./wgetX [WEBSITE_URL] (e.g. http://www.polytechnique.edu/accueil/index.html)

This program will download the html content of the webpage given as argument and save it in a file named received_page in the current directory (as raw text). This can be modified to save an html file.

Additionally the sample code can be found in the directory sample_code, and can be built with the makefile provided in that directory. It contains a simple client and server example using sockets. The client connects to the server, receives a message, prints it and exits. The server listens for incoming connections, accepts one, sends a message and exits.

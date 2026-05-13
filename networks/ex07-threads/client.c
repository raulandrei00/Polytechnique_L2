/**
 * Author: Kevin Jiokeng
 * LIX, Ecole Polytechnique
 * kevin.jiokeng@polytechnique.edu
 *
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <errno.h>
#include <arpa/inet.h>
#include <assert.h>
#include <pthread.h>
#include "message.h"

int sock;
struct sockaddr_in dest;

void* receive_thread(void* arg) { 
    char buffer[MAX_MSG_LEN];
    while (1) {
        ssize_t recv_len = recvfrom(sock, buffer, sizeof(buffer) - 1, 0, NULL, NULL);
        if (recv_len < 0) {
            fprintf(stderr, "recvfrom() failed: %s\n", strerror(errno));
            break;
        }
        buffer[recv_len] = '\0';
        printf("Received: %s", buffer);
    }
    return NULL;

}

int main(int argc, char* argv[]) {
    char* server_addr;
    int port;
    
    ///////////////////////////
    // Parsing parameter values
    ///////////////////////////
    if (argc < 3) {
        fprintf(stderr, "Missing argument. Syntax: %s <SERVER_ADDRESS> <PORT>\n", argv[0]);
	    return 1;
    }
    
    server_addr = argv[1];
    port = atoi(argv[2]);

    sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock < 0) {
        fprintf(stderr, "socket() failed: %s\n", strerror(errno));
        return 1;
    }
 
    memset(&dest, 0, sizeof(dest));
    dest.sin_family = AF_INET;
    dest.sin_port = htons(atoi(argv[2]));
 
    if (inet_pton(AF_INET, argv[1], &dest.sin_addr) <= 0) {
        fprintf(stderr, "Invalid address\n");
        close(sock);
        return 1;
    }
 


    printf("Running client for server at address %s and port %d\n", server_addr, port);


    
    pthread_t receive_thread_id;
    if (pthread_create(&receive_thread_id, NULL, receive_thread, NULL) != 0) {
        fprintf(stderr, "Failed to create receive thread: %s\n", strerror(errno));
        return 1;
    }
    pthread_detach(receive_thread_id); // Detach the thread to allow it to clean up automatically


    // main thread: send messages to server
        while (1) {
        char message[MAX_MSG_LEN];
        printf("Send: ");
        fflush(stdout);
 
        if (fgets(message, sizeof(message), stdin) == NULL) {
            fprintf(stderr, "Error reading input\n");
            break;
        }
        if (strcmp(message, "stop\n") == 0) break;
 
        ssize_t sent = sendto(sock, message, strlen(message), 0,
                              (struct sockaddr *)&dest, sizeof(dest));
        if (sent < 0) {
            fprintf(stderr, "sendto() failed: %s\n", strerror(errno));
            break;
        }
    }
 
    close(sock);


    
    return 0;
}
/**
 * Author: Kevin Jiokeng
 * LIX, Ecole Polytechnique
 * kevin.jiokeng@polytechnique.edu
 *
 */
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <errno.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <semaphore.h>
#include "message.h"

typedef struct {
    struct sockaddr_in client_addr;
    socklen_t client_len;
    char message[MAX_MSG_LEN];
    int message_len;
} request_t;

int sock;
unsigned int delay = 1000 * 1000;
sem_t semaphore;

void* handle_request(void* arg) {
    request_t *req = (request_t *)arg;

    usleep(delay);
    ssize_t sent = sendto(sock, req->message, req->message_len, 0,
                      (struct sockaddr *)&req->client_addr, req->client_len);
    if (sent < 0) {
        fprintf(stderr, "sendto() failed: %s\n", strerror(errno));
    }

    free(req);
    sem_post(&semaphore); // Release the semaphore after processing
    return NULL;
}

int main(int argc, char *argv[])
{
    ////////////////////////
    // Default params values
    ////////////////////////

    // The port on which the server should listen
    int port;

    // Maximum number of requests the server should be able to handle at the same time
    int n_requests_max = 5;

    // Processing time of each request (in microseconds)
    // You should simulate this processing by using 'usleep(delay);'
    

    ///////////////////////////
    // Parsing parameter values
    ///////////////////////////
    if (argc < 2)
    {
        fprintf(stderr, "Missing argument. Syntax: %s <PORT> [N_REQUESTS_MAX] [DELAY_MS].\n", argv[0]);
        return 1;
    }
    else
    {
        port = atoi(argv[1]);
    }

    if (argc >= 3)
    {
        n_requests_max = atoi(argv[2]);
    }

    if (argc >= 4)
    {
        delay = atoi(argv[3]) * 1000;
    }

    printf("Running server on port %d with %d max parallel requests and %d us as delay.\n", port, n_requests_max, delay);

    // Initialize the semaphore with the maximum number of concurrent requests
    sem_init(&semaphore, 0, n_requests_max);
    
    sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock < 0) {
        fprintf(stderr, "socket() failed: %s\n", strerror(errno));
        return 1;
    }

    struct sockaddr_in server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(port);
    server_addr.sin_addr.s_addr = INADDR_ANY;

    if (bind(sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        fprintf(stderr, "bind() failed: %s\n", strerror(errno));
        close(sock);
        return 1;
    }

        while (1) {
        request_t *req = malloc(sizeof(request_t));
        if (!req) {
            fprintf(stderr, "malloc failed\n");
            continue;
        }
 
        req->client_len = sizeof(req->client_addr);
        ssize_t n = recvfrom(sock, req->message, MAX_MSG_LEN - 1, 0,
                             (struct sockaddr *)&req->client_addr, &req->client_len);
        if (n < 0) {
            fprintf(stderr, "recvfrom() failed: %s\n", strerror(errno));
            free(req);
            continue;
        }
        req->message[n] = '\0';
        req->message_len = n;
 
        printf("Received: %s", req->message);
 
        sem_wait(&semaphore);  // block if N requests already active
 
        pthread_t tid;
        if (pthread_create(&tid, NULL, handle_request, req) != 0) {
            fprintf(stderr, "pthread_create() failed\n");
            free(req);
            sem_post(&semaphore);
            continue;
        }
        pthread_detach(tid);
    }
 
    close(sock);
    sem_destroy(&semaphore);


    // Wait for the specified delay
    usleep(delay);



    return 0;
}
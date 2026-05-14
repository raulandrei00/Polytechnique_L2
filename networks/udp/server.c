#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netdb.h>
#include<errno.h>
#include <arpa/inet.h>
#include <assert.h>

int main (int argc, char *argv[]) {

    assert (argc == 2 && "Usage: ./server PORT_NUMBER");

    int sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock < 0) {
        fprintf(stderr, "socket() failed: %s\n", strerror(errno));
        return 1;
    }

    struct sockaddr_in server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(atoi(argv[1]));
    server_addr.sin_addr.s_addr = INADDR_ANY;

    const struct sockaddr *server_addr_ptr = (const struct sockaddr *)&server_addr;

    int res = bind (sock, server_addr_ptr, sizeof(server_addr));

    if (res < 0) {
        fprintf(stderr, "bind() failed: %s\n", strerror(errno));
        close(sock);
        return 1;
    }
    
    struct sockaddr_in client;
    socklen_t client_len = sizeof(client);

    while (1) {
        char buff[256];

        res = recvfrom(sock, buff, sizeof(buff) - 1, 0, (struct sockaddr*)&client, &client_len);
        if (res < 0) {
            fprintf(stderr, "recvfrom() failed: %s\n", strerror(errno));
            close(sock);
            return 1;
        }
        buff[res] = '\0';
        printf("Received: %s", buff);
        if (strcmp(buff, "stop\n") == 0) {
            break;
        }

        res = sendto(sock, buff, res, 0, (struct sockaddr*)&client, client_len);
        if (res < 0) {
            fprintf(stderr, "sendto() failed: %s\n", strerror(errno));
            close(sock);
            return 1;
        }
    }
    
}
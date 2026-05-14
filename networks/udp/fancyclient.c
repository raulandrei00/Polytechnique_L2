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

    assert (argc == 3 && "Usage: client IP_ADDRESS, PORT_NUMBER");

    int sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock < 0) {
        fprintf(stderr, "socket() failed: %s\n", strerror(errno));
        return 1;
    }

    struct sockaddr_in dest;
    memset(&dest, 0, sizeof(dest));
    dest.sin_family = AF_INET;
    dest.sin_port = htons(atoi(argv[2]));
    
    if (inet_pton(AF_INET, argv[1], &dest.sin_addr) <= 0) {
        fprintf(stderr, "Invalid address\n");
        return 1;
    }

    // struct sockaddr_in server_addr;
    // memset(&server_addr, 0, sizeof(server_addr));
    // server_addr.sin_family = AF_INET;
    // server_addr.sin_port = htons(atoi(argv[1]));
    // server_addr.sin_addr.s_addr = INADDR_ANY;

    // const struct sockaddr *server_addr_ptr = (const struct sockaddr *)&server_addr;

    // bind(sock, server_addr_ptr, sizeof(server_addr));

    while (1) {

        char message[256];
        printf("Send: ");
        if (fgets(message, sizeof(message), stdin) == NULL) {
            fprintf(stderr, "Error reading input\n");
            break;
        }

        if (strcmp(message, "stop\n") == 0) {
            break;
        }

        ssize_t sent = sendto(sock, message, strlen(message), 0, (struct sockaddr *)&dest, sizeof(dest));
        if (sent < 0) {
            fprintf(stderr, "sendto() failed: %s\n", strerror(errno));
            close(sock);
            return 1;
        }

        // read from server
        char buffer[256];
        ssize_t recv_len = recvfrom(sock, buffer, sizeof(buffer) - 1, 0, NULL, NULL);
        if (recv_len < 0) {
            fprintf(stderr, "recvfrom() failed: %s\n", strerror(errno));
            close(sock);
            return 1;
        }
        buffer[recv_len] = '\0';
        printf("Received: %s", buffer);
    }

    close(sock);
    return 0;
}
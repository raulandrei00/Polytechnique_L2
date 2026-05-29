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


#define FYI 1
#define MYM 2
#define END 3 
#define TXT 4 
#define MOV 5
#define LFT 6 

#define NO_ROOM 0xFF

#define BUF_SIZE 512



static void dump_buffer(const char *tag, const unsigned char *buf, size_t len) {
    fprintf(stderr, "[%s] (%zu bytes):", tag, len);
    for (size_t i = 0; i < len; i++) {
        fprintf(stderr, " %3u", buf[i]);
    }
    fprintf(stderr, "\n");
}


static char player_symbol(unsigned char player) {
    if (player == 1) return 'X';
    if (player == 2) return 'O';
    return ' ';
}


static void display_board(const unsigned char *msg, ssize_t len) {
    char board[3][3];
    memset(board, ' ', sizeof(board));

    unsigned char n = (len >= 2) ? msg[1] : 0;

    for (unsigned char i = 0; i < n; i++) {
        size_t off = 2 + (size_t)i * 3;
        if (off + 2 >= (size_t)len) break;  // malformed / truncated 
        unsigned char player = msg[off];
        unsigned char col    = msg[off + 1];
        unsigned char row    = msg[off + 2];
        if (col < 3 && row < 3) {
            board[row][col] = player_symbol(player);
        }
    }

    printf("%u filled position%s.\n", n, (n == 1) ? "" : "s");
    for (int row = 0; row < 3; row++) {
        printf("%c|%c|%c\n", board[row][0], board[row][1], board[row][2]);
        if (row < 2) printf("-+-+-\n");
    }
    fflush(stdout);
}

static int ask_coordinate(const char *what) {
    char line[64];
    while (1) {
        printf("Enter %s (0-2): ", what);
        fflush(stdout);
        if (fgets(line, sizeof(line), stdin) == NULL) {
            fprintf(stderr, "Error reading input\n");
            exit(1);
        }
        char *end;
        long v = strtol(line, &end, 10);
        if (end != line && v >= 0 && v <= 2) {
            return (int)v; // checking for bad inputs
        }
        printf("Invalid value, please enter 0, 1 or 2.\n");
    }
}

int main(int argc, char *argv[]) {

    assert(argc == 3 && "Usage: client IP_ADDRESS PORT_NUMBER");

    int sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock < 0) {
        fprintf(stderr, "socket() failed: %s\n", strerror(errno));
        return 1;
    }

    struct sockaddr_in dest;
    memset(&dest, 0, sizeof(dest));
    dest.sin_family = AF_INET;
    dest.sin_port   = htons(atoi(argv[2]));

    if (inet_pton(AF_INET, argv[1], &dest.sin_addr) <= 0) {
        fprintf(stderr, "Invalid address: %s\n", argv[1]);
        close(sock);
        return 1;
    }

    if (connect(sock, (struct sockaddr *)&dest, sizeof(dest)) < 0) {
        fprintf(stderr, "connect() failed: %s\n", strerror(errno));
        close(sock);
        return 1;
    }

    {
        unsigned char hello[] = { TXT, 'H', 'e', 'l', 'l', 'o', '\0' };
        if (send(sock, hello, sizeof(hello), 0) < 0) {
            fprintf(stderr, "send(Hello) failed: %s\n", strerror(errno));
            close(sock);
            return 1;
        }
    }

    
    while (1){
        unsigned char buf[BUF_SIZE];
        ssize_t len = recv(sock, buf, sizeof(buf), 0);
        if (len < 0) {
            fprintf(stderr, "recv() failed: %s\n", strerror(errno));
            close(sock);
            return 1;
        }
        if (len == 0) {
            continue;
        }

        switch (buf[0]) {

        case TXT:
            buf[(len < BUF_SIZE) ? len : BUF_SIZE - 1] = '\0';
            printf("%s\n", buf + 1);
            fflush(stdout);
            break;

        case FYI:
            printf("[r] [FYI] (%zd bytes)\n", len);
            display_board(buf, len);
            break;

        case MYM: {
            int col = ask_coordinate("column");
            int row = ask_coordinate("row");
            unsigned char move[3] = { MOV, (unsigned char)col, (unsigned char)row };
            if (send(sock, move, sizeof(move), 0) < 0) {
                fprintf(stderr, "send(MOV) failed: %s\n", strerror(errno));
                close(sock);
                return 1;
            }
            break;
        }

        case END: {
            // winner variable also checks for full room
            unsigned char winner = (len >= 2) ? buf[1] : 0;
            if (winner == NO_ROOM) {
                printf("The game is full: no room for new participants.\n");
            } else if (winner == 0) {
                printf("Game over: it's a draw!\n");
            } else {
                printf("Game over: player %u (%c) wins!\n",
                       winner, player_symbol(winner));
            }
            fflush(stdout);
            close(sock);
            return 0;
        }

        case LFT:
            printf("A player has left the game.\n");
            fflush(stdout);
            break;

        default:
            fprintf(stderr, "Unknown message type %u\n", buf[0]);
            dump_buffer("unknown", buf, (size_t)len);
            break;
        }
    }

    close(sock);
    return 0;
}
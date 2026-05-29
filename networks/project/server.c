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

#define FYI 0x01
#define MYM 0x02
#define END 0x03
#define TXT 0x04
#define MOV 0x05
#define LFT 0x06

#define NO_ROOM 0xFF
#define DRAW    0x00

#define BUF_SIZE 512
#define MAX_PLAYERS 2


typedef struct {
    struct sockaddr_in addr;
    int                active;
} player_t;


static int same_endpoint(const struct sockaddr_in *a, const struct sockaddr_in *b) {
    return a->sin_addr.s_addr == b->sin_addr.s_addr &&
           a->sin_port        == b->sin_port;
}


static void send_to(int sock, const void *buf, size_t len,
                    const struct sockaddr_in *to) {
    if (sendto(sock, buf, len, 0, (const struct sockaddr *)to, sizeof(*to)) < 0) {
        fprintf(stderr, "sendto() failed: %s\n", strerror(errno));
    }
}

static void send_txt(int sock, const char *text, const struct sockaddr_in *to) {
    unsigned char buf[BUF_SIZE];
    buf[0] = TXT;
    size_t n = strlen(text);
    if (n > BUF_SIZE - 2) n = BUF_SIZE - 2; // leave room for the '\0'
    memcpy(buf + 1, text, n);
    buf[1 + n] = '\0';
    send_to(sock, buf, n + 2, to);
    // UDP = we send data and do not receive feedback about it reaching the client 
    // => no error checking here
}


static void send_mym(int sock, const struct sockaddr_in *to) {
    unsigned char b = MYM;
    send_to(sock, &b, 1, to);
    // UDP = we send data and do not receive feedback about it reaching the client 
    // => no error checking here
}


static void send_end(int sock, unsigned char winner, const struct sockaddr_in *to) {
    unsigned char buf[2] = { END, winner };
    send_to(sock, buf, 2, to);

}


static void board_init(int board[3][3]) {
    for (int r = 0; r < 3; r++)
        for (int c = 0; c < 3; c++)
            board[r][c] = 0;
}


static size_t build_fyi(unsigned char *buf, int board[3][3]) {
    buf[0] = FYI;
    size_t idx = 2;
    unsigned char n = 0;
    for (int row = 0; row < 3; row++) {
        for (int col = 0; col < 3; col++) {
            if (board[row][col] != 0) {
                buf[idx++] = (unsigned char)board[row][col]; 
                buf[idx++] = (unsigned char)col;
                buf[idx++] = (unsigned char)row;
                n++;
            }
        }
    }
    buf[1] = n;
    return idx;
}

static void send_fyi(int sock, int board[3][3], const struct sockaddr_in *to) {
    unsigned char buf[BUF_SIZE];
    size_t len = build_fyi(buf, board);
    send_to(sock, buf, len, to);
}


static int check_winner(int board[3][3]) {

    for (int i = 0; i < 3; i++) {
        if (board[i][0] != 0 &&
            board[i][0] == board[i][1] && board[i][1] == board[i][2])
            return board[i][0];
        if (board[0][i] != 0 &&
            board[0][i] == board[1][i] && board[1][i] == board[2][i])
            return board[0][i];
    }

    if (board[0][0] != 0 &&
        board[0][0] == board[1][1] && board[1][1] == board[2][2])
        return board[0][0];
    if (board[0][2] != 0 &&
        board[0][2] == board[1][1] && board[1][1] == board[2][0])
        return board[0][2];
    return 0;
}


static int board_full(int board[3][3]) {
    for (int r = 0; r < 3; r++)
        for (int c = 0; c < 3; c++)
            if (board[r][c] == 0)
                return 0;
    return 1;
}


int main(int argc, char *argv[]) {

    assert(argc == 2 && "Usage: ./server PORT_NUMBER");

    int sock = socket(AF_INET, SOCK_DGRAM, 0);
    if (sock < 0) {
        fprintf(stderr, "socket() failed: %s\n", strerror(errno));
        return 1;
    }

    struct sockaddr_in server_addr;
    memset(&server_addr, 0, sizeof(server_addr));
    server_addr.sin_family      = AF_INET;
    server_addr.sin_port        = htons(atoi(argv[1]));
    server_addr.sin_addr.s_addr = INADDR_ANY;

    if (bind(sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        fprintf(stderr, "bind() failed: %s\n", strerror(errno));
        close(sock);
        return 1;
    }

    printf("Server listening on port %s ...\n", argv[1]);
    fflush(stdout);

    player_t players[MAX_PLAYERS];
    for (int i = 0; i < MAX_PLAYERS; i++) players[i].active = 0;
    int num_players = 0;


    while (num_players < MAX_PLAYERS) {
        unsigned char buf[BUF_SIZE];
        struct sockaddr_in client;
        socklen_t clen = sizeof(client);

        ssize_t len = recvfrom(sock, buf, sizeof(buf), 0,
                               (struct sockaddr *)&client, &clen);
        if (len < 0) {
            fprintf(stderr, "recvfrom() failed: %s\n", strerror(errno));
            close(sock);
            return 1;
        }
        if (len < 1 || buf[0] != TXT) {
            continue;
        }


        int known = 0;
        for (int i = 0; i < num_players; i++) {
            if (same_endpoint(&players[i].addr, &client)) { known = 1; break; }
        }
        if (known) continue;


        players[num_players].addr   = client;
        players[num_players].active = 1;
        num_players++;

        char greeting[64];
        snprintf(greeting, sizeof(greeting),
                 "Welcome! You are player %d (%c).",
                 num_players, (num_players == 1) ? 'X' : 'O');
        send_txt(sock, greeting, &client);

        printf("Player %d connected.\n", num_players);
        fflush(stdout);
    }

    send_txt(sock, "Both players connected. The game begins!", &players[0].addr);
    send_txt(sock, "Both players connected. The game begins!", &players[1].addr);


    int board[3][3];
    board_init(board);

    int current = 0;

    while (1) {

        send_fyi(sock, board, &players[0].addr);
        send_fyi(sock, board, &players[1].addr);

        send_mym(sock, &players[current].addr);


        int moved = 0;
        while (!moved) {
            unsigned char buf[BUF_SIZE];
            struct sockaddr_in client;
            socklen_t clen = sizeof(client);

            ssize_t len = recvfrom(sock, buf, sizeof(buf), 0,
                                   (struct sockaddr *)&client, &clen);
            if (len < 0) {
                fprintf(stderr, "recvfrom() failed: %s\n", strerror(errno));
                close(sock);
                return 1;
            }
            if (len < 1) continue;


            int is_player = 0, idx = -1;
            for (int i = 0; i < num_players; i++) {
                if (same_endpoint(&players[i].addr, &client)) { is_player = 1; idx = i; break; }
            }
            if (!is_player) {
                if (buf[0] == TXT) send_end(sock, NO_ROOM, &client);
                continue;
            }


            if (idx != current || buf[0] != MOV) {
                continue;
            }


            if (len < 3) {
                send_txt(sock, "Malformed move. Try again.", &players[current].addr);
                send_mym(sock, &players[current].addr);
                continue;
            }
            int col = buf[1];
            int row = buf[2];
            if (col < 0 || col > 2 || row < 0 || row > 2) {
                send_txt(sock, "Coordinates out of range (0-2). Try again.",
                         &players[current].addr);
                send_mym(sock, &players[current].addr);
                continue;
            }
            if (board[row][col] != 0) {
                send_txt(sock, "That cell is already taken. Try again.",
                         &players[current].addr);
                send_mym(sock, &players[current].addr);
                continue;
            }


            board[row][col] = current + 1;
            moved = 1;
            printf("Player %d played (col=%d, row=%d).\n", current + 1, col, row);
            fflush(stdout);
        }


        int winner = check_winner(board);
        if (winner != 0 || board_full(board)) {
            unsigned char code = (winner != 0) ? (unsigned char)winner : DRAW;


            send_fyi(sock, board, &players[0].addr);
            send_fyi(sock, board, &players[1].addr);
            send_end(sock, code, &players[0].addr);
            send_end(sock, code, &players[1].addr);

            if (winner != 0)
                printf("Game over: player %d wins!\n", winner);
            else
                printf("Game over: draw.\n");
            fflush(stdout);
            break;
        }


        current = 1 - current;
    }

    close(sock);
    return 0;
}
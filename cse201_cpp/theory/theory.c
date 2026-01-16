#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<fcntl.h>
#include<unistd.h>
#include<stdbool.h>
#include<assert.h>

int read_sudoku (char* path , int grid[]) {

    int fd = open (path , O_RDONLY);
    read(fd , grid , 81 * sizeof(int));


    return 0;
}

struct X {
    int v1, v2;
    char v3;
}
struct X obj = {.v1 = 10 , .v2 = 20 , .v3 = 'a'};

void main () {
    // print to output stream (stderr stdcout ...)
    fprintf(stderr , "Error: ...\n");
    char buff[50];
    // write to buffer
    snprintf(buff , 50 , "%s-%d" , pika->name , i);
    // pointers
    Item* ptr = malloc (items * sizeof(struct Item));
    free(ptr);
    int a = 10;
    int* ptr_a = &a;
    
}
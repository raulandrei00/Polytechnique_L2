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

void print_sudoku(int grid[]) {
    for (int i = 0; i < 9; i++) {
        printf("| ");
        for (int j = 0; j < 9; j++) {
            printf("%d " , grid[9*i + j]);
            if (j % 3 == 2) printf("| ");
        }
        putchar('\n');
        if (i % 3 == 2) printf("--------------------------\n");
    }
}



bool assign_pos (int val , int x , int y , int grid[]){

    for (int i = 0; i < 9; i++) {
        if (grid[i*9 + y] == val) return false;
    }
    for (int j = 0; j < 9; j++) {
        if (grid[9*x + j] == val) return false;
    }
    for (int i = x / 3 * 3; i < x/3*3 + 3; i++) {
        for (int j = y/3*3; j < y/3*3 + 3; j++) {
            if (grid[9*i + j] == val) return false;
        }
    }

    grid[9*x + y] = val;
    return true;
}

bool solved = false;

bool solve_sudoku (int grid[], int pos) {

    if (pos == 81) return 1;
    

    for (int p = pos; p < 81; p++) {
        int i = p / 9 , j = p % 9;
        if (grid[9*i + j] == 0) {
                
            for (int val = 1; val <= 9; val++) {
                if (assign_pos(val , i , j, grid)) {
                    if (solve_sudoku(grid, p+1))
                        return 1;
                    else {
                        grid[9*i + j] = 0;
                        
                    }
                }
            }
            return 0;
        }
        
    }
   
    return 0;
}

int main (int argc , char* argv[]) {


    if (argc == 1) {
        fprintf(stderr , "Error: no file provided\n");
        exit(0);
    }

    int *grid = malloc(81 * sizeof(int));

    read_sudoku(argv[1] , grid);

    assert(solve_sudoku(grid, 0));

    print_sudoku(grid);

    return 0;
}
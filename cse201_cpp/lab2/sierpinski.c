#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include<math.h>

int sort_get_index (float* tab , int top , float val) {
    int index = 0;
    while (index < top && tab[index] < val) {
        index++;
    }
    return index;
}

void sort_insert_at (float* tab , int i , int top , float val) {
    // realloc
    // tab = realloc(tab , (top+1) * sizeof(float));
    for (int pos = top-1; pos >= i; pos--) {
        tab[pos+1] = tab[pos];
    }
    tab[i] = val;
}

void sort_insert(float* tab , int top , float val) {
    int i = sort_get_index(tab , top , val);
    sort_insert_at(tab , i , top , val);
}

const int nb_columns () { return 32; }
const int nb_lines () { return 16; }

void grid_display (char grid[nb_lines()][nb_columns()]) {
    for (int lin = 0; lin < nb_lines(); lin++) {
        for (int col = 0; col < nb_columns(); col++) {
            putchar(grid[lin][col]);
        }
        putchar('\n');
    }
}
void plot_point(char grid[nb_lines()][nb_columns()] , int x , int y, char add) {
    if (y < 0 || x < 0 || y >= nb_lines() || x >= nb_columns()) {
        printf("Error: invalid coordinate provided to plot_point\n");
        exit(0);
    }
    grid[nb_lines()-y-1][x] = add;
}

void plot_vline(char grid[nb_lines()][nb_columns()] , int x , float fy0 , float fy1 , char pixel) {
    int y0 = fy0+0.49999, y1 = fy1+0.49999;
    assert(y0 <= y1);
    for (int y = y0; y <= y1; y++) {
        plot_point(grid , x , y , pixel);
    }
}

struct Point {
    float x , y;
};

struct Point intersection (struct Point p1 , struct Point p2 , float x) {
    float ry = p1.y + (x - p1.x) * (p2.y - p1.y) / (p2.x - p1.x);
    return (struct Point) {x , ry};
}

float min(float x , float y) {
    return x <= y ? x : y;
}

float max(float x , float y) {
    return x < y ? y : x;
}

void plot_poly_sweep (char grid[nb_lines()][nb_columns()] , struct Point* p, int n , int x , char pixel) {
    
    float vlines[4 * n];
    int top = 0;
    
    printf("sweep %d:" , x);

    for (int i = 0 , j = n-1; i < n; i++ , j = (j+1)%n) {
        // printf("(%d, %d)" , j , i);
        if (min(p[i].x , p[j].x) <= x && x <= max(p[i].x , p[j].x)) {
            struct Point intersect = intersection(p[i] , p[j] , x);
            // printf("(%f, %f)" , intersect.x , intersect.y);
            sort_insert(vlines , top , intersect.y);
            top++;
        }
    }
    for (int i = 0; i < top; i++) {
        // printf("%f " , vlines[i]);
        
    }
    putchar('\n');
}

void plot_poly (char grid[nb_lines()][nb_columns()] , struct Point* p, int nrp, char pixel) {
    for (int x = 0; x < nb_columns(); x++) {
        plot_poly_sweep(grid , p , nrp , x , pixel);
    }
}
 
int main () {

    // printf("Hello world!!!");

    // float *tab;
    // tab = malloc(5 * sizeof(float));
    // tab[0] = 1; tab[1] = 3; tab[2] = 5; tab[3] = 7; tab[4] = 0;
    // sort_insert(tab , 5, 6);
    // sort_insert(tab , 6,1);
    // sort_insert(tab , 7,2);

    // for (int i = 0; i < 7; i++) {
    //     printf("%f " , tab[i]);
    // }

    char grid[nb_lines()][nb_columns()];
    
    // for (int i = 0; i < nb_columns(); i++){
    //     for (int j = 0; j < nb_lines(); j++) {
    //         plot_point(grid , i , j , ' ');
    //     }
    // }

    // plot_vline(grid , 7 , 1.5 , 2.5 , '|');

    // grid_display(grid);

    struct Point p[] = { { 2, 13 }, { 10, 13 }, { 30, 7 }, { 10, 1 }, { 2, 1 }, { 18, 7 } };

    plot_poly(grid , p , sizeof(p) / sizeof(struct Point), 'W');

    return 0;
}
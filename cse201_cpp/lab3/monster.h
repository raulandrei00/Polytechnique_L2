#include<string.h>

// const int MAX_SIZE = 256;

struct Monster {
    char* name;
    int health;
};


struct Monster* create_monster (char* , int );
void display_monster (struct Monster* );
void delete_monster (struct Monster* );


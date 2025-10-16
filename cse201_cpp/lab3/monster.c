#include<string.h>
#include<stdlib.h>
#include<stdio.h>
#include "monster.h"

struct Monster* create_monster (char* name , int health) {
    
    struct Monster* ret = malloc(sizeof(struct Monster));
    ret->name = malloc(strlen(name)+1);
    
    strcpy (ret->name , name);
    ret->health = health;
    return ret;
}

void display_monster (struct Monster * m) {
    printf("Name: %s , Health: %d\n" , m->name , m->health);

}

void delete_monster (struct Monster* M) {
    free(M->name);
    free(M);
}
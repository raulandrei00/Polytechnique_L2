#include<string.h>
#include<stdlib.h>
#include<stdio.h>
#include "monster.h"
#include "army.h"

struct Army {
    struct Monster** monsters;
    int top , capacity;
};

struct Army* create_army () {
    struct Army* ret = malloc(sizeof(struct Army));
    ret->top = -1;
    ret->capacity = 0;
    return ret;
}

void add_monster (struct Army* a , struct Monster* m) {
    a->top++;
    if (a->top == a->capacity){ 
        struct Monster** new_arr = malloc(2 * a->capacity * sizeof(struct Monster* ));
        memcpy (new_arr , a->monsters , a->capacity * sizeof(struct Monster* ));
        free(a->monsters);
        a->monsters = new_arr;
    }
    struct Monster* cpy = create_monster(m->name , m->health);
    a->monsters[a->top] = cpy;
}

void display_army (struct Army* a) {
    printf("Army has %d monster(s)\n" , a->top+1);
    for (int i = 0; i <= a->top; i++) {
        display_monster(a->monsters[i]);
    }
}

void delete_army (struct Army* a) {
    for (int i = 0; i <= a->top; i++) {
        delete_monster(a->monsters[i]);
    }
    free(a);
    return;
}
#include"monster.h"
#include"army.h"
#include<assert.h>
#include<stdlib.h>
#include<stdio.h>

struct Node {
    struct Monster* m;
    struct Node* next;
};

struct Army {
    struct Node *first_monster , *end;
    int nr_m;
};

struct Node* null_node_ptr () {
    struct Node* ret = malloc(sizeof(struct Node));
    ret->m = NULL;
    ret->next = NULL;
    return ret;
}

struct Army* create_army () {
    struct Army* ret = malloc(sizeof(struct Army));
    ret->nr_m = 0;
    ret->first_monster = null_node_ptr();
    ret->end = ret->first_monster;
    return ret;
}

void add_monster (struct Army* a , struct Monster* m) {
    assert(a->end->m == NULL);
    struct Node* new_end = null_node_ptr();
    struct Monster* cpy = create_monster(m->name , m->health);
    a->end->m = cpy;
    a->end->next = new_end;
    a->end = new_end;
    a->nr_m++;
}

void display_army (struct Army* a) {
    printf("Zombie Army has %d monster(s)\n" , a->nr_m);
    
    for (struct Node* it = a->first_monster; it != a->end ;it = it->next) {
        display_monster(it->m);
    }

}

void delete_army (struct Army* a) {
    
    for (struct Node* it = a->first_monster; it != a->end ;it = it->next) {
        delete_monster(it->m);

    }
    free(a);
}
#include<stdio.h>
#include "monster.h"
#include "army.h"

int main () {

    // putchar('r');

    struct Monster* pika = create_monster("Pikachu" , 69);

    display_monster(pika);

    
    struct Monster* M[10];

    for (int i = 0; i < 10; i++) {
        char buff[50];
        snprintf(buff , 50 , "%s-%d" , pika->name , i);
        M[i] = create_monster(buff , 5);
    }

    for (int i = 0; i < 10; i++) {
        printf("%s\n" , M[i]->name);
    }

    struct Army* a = create_army();
    add_monster(a , pika);
    add_monster(a , pika);
    add_monster(a , pika);
    display_army(a);



    return 0;
}
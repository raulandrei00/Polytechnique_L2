#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fancy-hello-world.h"

int main () {
    char name[51];
    char output[250];  
    fgets(name, 51, stdin);  // reads up to 50 chars from keyboard

    hello_string(name, output);

    printf("%s\n", output);

    return 0;
}

void hello_string(char* name, char* output) {
    const char* hello_string = "Hello World, hello ";

    strcpy(output, hello_string);
    strcat(output, name);
}

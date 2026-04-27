#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fancy-hello-world.h"

int main () {
    char output[256];
    hello_string("Alice", output);
    printf("%s\n", output);
    return 0;
}

void hello_string(char* name, char* output) {
    const char* hello_string = "hello world, hello ";

    strcpy(output, hello_string);
    strcat(output, name);
}

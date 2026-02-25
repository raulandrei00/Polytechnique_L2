#include <stdio.h>


int main () {
    int x = __INT_MAX__;
    printf("%x", (1 << 31) + x + 1);

}
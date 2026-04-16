#include <stdio.h>
#include <string.h>

int hexmatch(unsigned val, char *sval)
{
    char cbuf[110];
    /* Make position of check string unpredictable */
    char *s = cbuf + random() % 100;
    sprintf(s, "%.8x", val);
    return strncmp(sval, s, 9) == 0;
}

int main() {

    printf("%d\n", hexmatch(0xdeadbeef, "deadbeef"));
}
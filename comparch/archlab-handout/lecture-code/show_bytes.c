#include <stdio.h>
#include <stdint.h>

/*
 * cc -o show_bytes -Wall show_bytes.c
 */

typedef unsigned char *pointer;

void show_bytes(pointer start, int len)
{
    int i;
    for (i = 0; i < len; i++)
	printf("%p\t0x%.2x\n", start+i, start[i]);
    printf("\n");
}

int main(int argc, char** argv)
{
    {
    int8_t a = 0;
    printf("int a = %d;\n",a);
    show_bytes((pointer) &a, sizeof(int8_t));
    }

    {
    int8_t a = -1;
    printf("int a = %d;\n",a);
    show_bytes((pointer) &a, sizeof(int8_t));
    }

    {
    int32_t a = 0xbaddcafe;
    printf("int a = 0xbaddcafe;\n");
    show_bytes((pointer) &a, sizeof(int32_t));
    }

    return 0;
}


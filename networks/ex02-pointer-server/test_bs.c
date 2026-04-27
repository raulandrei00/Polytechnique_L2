// #include<stdio.h>

// struct idserver {
// char * id;
// char * region; // eur asr ame afr
// int latency; // in usec
// char status[8]; // up down unknown
// int *nthreads;
// };

// int main(int argc, char* argv[]){
//      idserver cmok;
//      cmok.latency = 600;
//      cmok.region = "eur";
//      cmok.id = "cmok";
//      strncpy(cmok.status, "up", strlen("up") + 1);
//      int p = 70;
//      cmok.nthreads = &p;

//     printf("cmok: %p\n", cmok);
//     return 0;
// }

#include<stdio.h>

int main() 
{ 
   char s[]="hello", t[]="hello";
   
   if(s==t){
	   printf("equal strings");
	}
}
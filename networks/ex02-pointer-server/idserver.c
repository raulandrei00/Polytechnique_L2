/*
 * idserver.c
 *
 *  Created on: Feb 15, 2016
 *      Author: jiaziyi
 *  Updated: JACF, 2020
 */

#include<stdlib.h>
#include<stdio.h>
#include<string.h>

#include "idserver.h"

/**
 * print the server's information
 */
void print_idserver(idserver s)
{
	printf("Id: %s\n", s.id);
	printf("Latency (usec): %d\n", s.latency);
	printf("Region: %s\n", s.region);
	printf("Status: %s\n", s.status);
	printf("Nbr of threads: %d\n", *s.nthreads);
}

/**
 * try to modify the server information
 */
void modify(idserver s, char *id, int latency, char status[])
{
	s.latency = latency;
    s.id = malloc(strlen(id) + 1);

    strcpy(s.id, id);
    strcpy(s.status, status);
}

/**
 * try to modify the server information using pointer
 */
void modify_by_pointer(idserver *s, char *id, int latency, char status[])
{
	s->latency = latency;

    s->id = malloc(strlen(id) + 1);

    strcpy(s->id, id);
    strcpy(s->status, status);
}

idserver* create_idserver(char *id, char *region, int latency,
		char *status, int *nthreads)
{
//  the issue is referencing values that will go out of scope
//  note that even string literals can be stored on the stack as compiler optimization.
//  modification made: all strings copied with malloc (), strncpy ()
//  all ints copied carefully by value, not ref
	
	idserver *s = malloc(sizeof(idserver)); // also added malloc for struct itself
	s->id = malloc(strlen(id) + 1);
	strncpy(s->id, id, strlen(id)+1);

	s->region = malloc(strlen(region) + 1);
	strncpy(s->region, region, strlen(region)+1);

	// this is already stored as int so OK
	s->latency = latency;
	
	strncpy(s->status, status, strlen(status)+1);
	s->nthreads = malloc(sizeof(int));
	*(s->nthreads) = *nthreads;
	puts("---print inside create_idserver function---");
	print_idserver(*s);
	puts("---end of print inside");
	return s;
}

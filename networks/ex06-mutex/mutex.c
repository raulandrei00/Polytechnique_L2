/*
 * mutex.c
 *
 *  Created on: Mar 19, 2016
 *      Author: jiaziyi
 */
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

#define NTHREADS 50
void *increase_counter(void *);


int  counter = 0;

int* ptr_mut = &counter;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

int main()
{
	pthread_t tids[NTHREADS];
	//create 50 threads of increase_counter, each thread adding 1 to the counter
	for (int i = 0; i < NTHREADS; i++)
	{
		pthread_t tid;
		pthread_create(&tid, NULL, increase_counter, NULL);
		tids[i] = tid;
	}
	// pthread_exit(NULL);
	for (int i = 0; i < NTHREADS; i++)
	{
		pthread_join(tids[i], NULL);
	}

	printf("\nFinal counter value: %d\n", counter);
}

void *increase_counter(void *arg)
{

	pthread_mutex_lock(&mutex);
	printf("Thread number %ld, working on counter. The current value is %d\n", (long)pthread_self(), counter);
	int i = counter;
	// initially:
	// usleep (10000); //simulate the data processing | when not commented all counters print 0 because "counter = i+1" executes just after all are done
	// if we comment this, then the counter is not (necessarily) updated correctly before printing either


	counter = i+1;
	pthread_mutex_unlock(&mutex);
	return NULL;
}

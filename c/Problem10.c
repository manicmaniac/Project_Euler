/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */
#include <math.h>
#include <stdio.h>

void sieve(char *array, size_t size) {
    size_t i, j, limit;

    array[0] = 1;
    array[1] = 1;
    limit = (size_t)sqrt((double)size);
    for (i = 2; i <= limit; i++) {
        if (!array[i]) {
            for (j = i * i; j < size; j += i) {
                array[j] = 1;
            }
        }
    }
}

int main(int argc, char **argv) {
#define SIZE_OF_ARRAY 2000000
    char array[SIZE_OF_ARRAY] = { 0 };
    size_t i;
    long sum;

    sieve(array, SIZE_OF_ARRAY);
    sum = 0;
    for (i = 0; i < SIZE_OF_ARRAY; i++) {
        if (!array[i]) {
            sum += i;
        }
    }
    printf("%ld\n", sum);
    return 0;
#undef SIZE_OF_ARRAY
}

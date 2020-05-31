/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */
#include <math.h>
#include <stdio.h>

void sieve(char *array, size_t size) {
    array[0] = 1;
    array[1] = 1;
    size_t limit = (size_t)sqrt((double)size);
    for (size_t i = 2; i <= limit; i++) {
        if (!array[i]) {
            for (size_t j = i * i; j < size; j += i) {
                array[j] = 1;
            }
        }
    }
}

int main(void) {
    char array[2000000] = { 0 };
    sieve(array, sizeof(array) / sizeof(array[0]));
    long sum = 0;
    for (size_t i = 0; i < sizeof(array) / sizeof(array[0]); i++) {
        if (!array[i]) {
            sum += i;
        }
    }
    printf("%ld\n", sum);
    return 0;
}

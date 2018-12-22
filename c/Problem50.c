/*
 * The prime 41, can be written as the sum of six consecutive primes:
 *
 * 41 = 2 + 3 + 5 + 7 + 11 + 13
 *
 * This is the longest sum of consecutive primes that adds to a prime below
 * one-hundred.
 *
 * The longest sum of consecutive primes below one-thousand that adds to a prime,
 * contains 21 terms, and is equal to 953.
 *
 * Which prime, below one-million, can be written as the sum of the most
 * consecutive primes?
 */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

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

int main(int argc, const char *argv[]) {
    char array[1000000] = { 0 };
    int prime, *primes, start, current, i, j, k, length, max_value, max_length;
    int primes_count;

    sieve(array, sizeof(array));
    primes_count = 0;
    for (i = 0; i < sizeof(array); i++) {
        if (!array[i]) {
            primes_count++;
        }
    }
    primes_count = 0;
    primes = malloc(primes_count * sizeof(int));
    for (i = 0; i < sizeof(array); i++) {
        if (!array[i]) {
            primes[primes_count] = i;
            primes_count++;
        }
    }
    max_length = 0;
    max_value = 0;
    for (i = 0; i < primes_count; i++) {
        prime = primes[primes_count - i - 1];
        for (j = 0; j < primes_count; j++) {
            current = prime;
            start = primes[j];
            length = 0;
            for (k = j; k < primes[primes_count - 1]; k++) {
                current -= primes[k];
                length++;
                if (current < 0) {
                    break;
                }
                if (current == 0) {
                    if (max_length < length) {
                        max_length = length;
                        max_value = prime;
                    }
                    break;
                }
            }
        }
    }
    printf("%d\n", max_value);
    return 0;
}

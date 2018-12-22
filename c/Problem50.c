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

int is_prime(int x) {
    int i, sqrt_x;

    if (x == 2) {
        return 1;
    }
    if (x < 2 || x % 2 == 0) {
        return 0;
    }
    sqrt_x = (int)sqrt(x);
    for (i = 3; i <= sqrt_x; i += 2) {
        if (x % i == 0) {
            return 0;
        }
    }
    return 1;
}

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

int *create_primes_below(size_t *primes_count, int x) {
    char *array;
    int *primes;
    size_t i, j;

    array = calloc(x, sizeof(char));
    sieve(array, x);
    for (i = j = 0; i < x; i++) {
        if (!array[i]) {
            j++;
        }
    }
    primes = malloc(j * sizeof(int));
    for (i = j = 0; i < x; i++) {
        if (!array[i]) {
            primes[j] = i;
            j++;
        }
    }
    free(array);
    if (primes_count) {
        *primes_count = j;
    }
    return primes;
}

int sum_ints(int *array, size_t start, size_t length) {
    int sum = 0;
    size_t i;

    for (i = start; i < start + length; i++) {
        sum += array[i];
    }
    return sum;
}

int main(int argc, const char *argv[]) {
    int sum, i, j, *primes, start, max_sum;
    size_t primes_count, length, max_length;

    sum = 0;
    for (i = 0; sum < 1000000; i++) {
        if (is_prime(i)) {
            sum += i;
        }
    }
    primes = create_primes_below(&primes_count, i);
    max_sum = 0;
    max_length = 0;
    for (start = 0; start < primes_count; start++) {
        for (length = primes_count - start; length > 0; length--) {
            sum = sum_ints(primes, start, length);
            if (is_prime(sum) && max_length < length) {
                max_length = length;
                max_sum = sum;
            }
        }
    }
    free(primes);
    printf("%d\n", max_sum);
    return 0;
}

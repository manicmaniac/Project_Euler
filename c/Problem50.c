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
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

bool is_prime(int x) {
    if (x == 2) {
        return true;
    }
    if (x < 2 || x % 2 == 0) {
        return false;
    }
    int sqrt_x = (int)sqrt(x);
    for (int i = 3; i <= sqrt_x; i += 2) {
        if (x % i == 0) {
            return false;
        }
    }
    return true;
}

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

int *create_primes_below(size_t *primes_count, int x) {
    char *array = calloc(x, sizeof(char));
    sieve(array, x);
    size_t j = 0;
    for (size_t i = 0; i < x; i++) {
        if (!array[i]) {
            j++;
        }
    }
    int *primes = malloc(j * sizeof(int));
    j = 0;
    for (size_t i = 0; i < x; i++) {
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
    for (size_t i = start; i < start + length; i++) {
        sum += array[i];
    }
    return sum;
}

int main(void) {
    int sum = 0;
    int i;
    for (i = 0; sum < 1000000; i++) {
        if (is_prime(i)) {
            sum += i;
        }
    }
    size_t primes_count;
    int *primes = create_primes_below(&primes_count, i);
    int max_sum = 0;
    size_t max_length = 0;
    for (int start = 0; start < primes_count; start++) {
        for (size_t length = primes_count - start; length > 0; length--) {
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

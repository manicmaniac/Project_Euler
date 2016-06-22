/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int *sieve(int limit, size_t *size) {
    int i, j, *search, *result;
    double sqrt_limit;

    search = calloc(limit, sizeof(int));
    search[0] = search[1] = 1;
    sqrt_limit = sqrt(limit);
    for (i = 2; i < sqrt_limit; i++) {
        if (!search[i]) {
            for (j = i * i; j < limit; j += i) {
                search[j] = 1;
            }
        }
    }
    result = malloc(limit * sizeof(int));
    for (i = j = 0; i < limit; i++) {
        if (!search[i]) {
            result[j++] = i;
        }
    }
    *size = j;
    free(search);
    return result;
}

int main(int argc, const char *argv[]) {
    long res;
    int i, *primes;
    size_t size;

    primes = sieve(2000000, &size);
    for (res = i = 0; i < size; i++) {
        res += primes[i];
    }
    free(primes);
    printf("%ld\n", res);
    return 0;
}

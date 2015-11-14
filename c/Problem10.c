/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

static const int limit = 2000000;

int *sieve(int limit, size_t *size) {
    int *search, *result;
    int i, j;
    double sqrt_limit;

    if (limit < 2) {
        return NULL;
    }
    search = calloc(limit, sizeof(int));
    result = malloc(limit * sizeof(int));
    search[0] = 1;
    search[1] = 1;
    sqrt_limit = sqrt(limit);
    *size = 0;
    for (i = 2; i <= limit; i++) {
        if (!search[i]) {
            if (i <= sqrt_limit) {
                for (j = i << 1; j < limit; j += i) {
                    search[j] = 1;
                }
            }
            result[*size] = i;
            *size += 1;
        }
    }
    free(search);
    return realloc(result, *size * sizeof(int));
}

int main(int argc, const char *argv[]) {
    size_t i, size;
    int *primes;
    long res;

    primes = sieve(limit, &size);
    res = 0;
    for (i = 0; i < size; i++) {
        res += primes[i];
    }
    free(primes);
    printf("%ld\n", res);
    return 0;
}

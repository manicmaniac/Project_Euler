/*
 * The number, 197, is called a circular prime because all rotations of the
 * digits: 197, 971, and 719, are themselves prime.
 *
 * There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
 * 73, 79, and 97.
 *
 * How many circular primes are there below one million?
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

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

int generate_circulars(int x, void *context, int (*callback)(int, void *)) {
    int ndigits, i, stop;
    div_t dm = { 0 };

    ndigits = x ? (int)(log10(abs(x)) + 1) : 1;
    dm.quot = x;
    for (i = 0; i < ndigits; i++) {
        stop = callback(dm.quot, context);
        if (stop) {
            return stop;
        }
        dm = div(dm.quot, 10);
        dm.quot += dm.rem * pow(10, ndigits - 1);
    }
    return 0;
}

static int is_composite(int x, void *context) {
    char *is_composites_by_n  = (char *)context;

    return is_composites_by_n[x];
}

int main(int argc, const char *argv[]) {
    char is_composites_by_n[1000000] = { 0 };
    int count, i, is_circular_prime;

    count = 0;
    sieve(is_composites_by_n, sizeof(is_composites_by_n) / sizeof(is_composites_by_n[0]));
    for (i = 0; i < sizeof(is_composites_by_n) / sizeof(is_composites_by_n[0]); i++) {
        is_circular_prime = !generate_circulars(i, is_composites_by_n, is_composite);
        if (is_circular_prime) {
            count++;
        }
    }
    printf("%d\n", count);
    return 0;
}

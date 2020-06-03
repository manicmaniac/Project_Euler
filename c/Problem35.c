/*
 * The number, 197, is called a circular prime because all rotations of the
 * digits: 197, 971, and 719, are themselves prime.
 *
 * There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
 * 73, 79, and 97.
 *
 * How many circular primes are there below one million?
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

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

int generate_circulars(int x, void *context, bool (*callback)(int, void *)) {
    int ndigits = x ? (int)(log10(abs(x)) + 1) : 1;
    div_t dm = { .quot = x };
    for (int i = 0; i < ndigits; i++) {
        bool stop = callback(dm.quot, context);
        if (stop) {
            return stop;
        }
        dm = div(dm.quot, 10);
        dm.quot += dm.rem * pow(10, ndigits - 1);
    }
    return 0;
}

static bool is_composite(int x, void *context) {
    char *is_composites_by_n  = (char *)context;
    return is_composites_by_n[x];
}

int main(void) {
    char is_composites_by_n[1000000] = { 0 };
    int count = 0;
    sieve(is_composites_by_n, sizeof(is_composites_by_n) / sizeof(is_composites_by_n[0]));
    for (size_t i = 0; i < sizeof(is_composites_by_n) / sizeof(is_composites_by_n[0]); i++) {
        bool is_circular_prime = !generate_circulars(i, is_composites_by_n, is_composite);
        if (is_circular_prime) {
            count++;
        }
    }
    printf("%d\n", count);
    return 0;
}

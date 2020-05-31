/*
 * The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
 * by 3330, is unusual in two ways: (i) each of the three terms are prime, and,
 * (ii) each of the 4-digit numbers are permutations of one another.
 *
 * There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
 * exhibiting this property, but there is one other 4-digit increasing sequence.
 *
 * What 12-digit number do you form by concatenating the three terms in this
 * sequence?
 */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

int is_permuting(int *xs, size_t size) {
    size_t i;
    div_t dm;
    char digits[10], previous_digits[10];

    for (i = 0; i < size; i++) {
        memset(digits, 0, sizeof(digits));
        dm.quot = xs[i];
        while (dm.quot) {
            dm = div(dm.quot, 10);
            digits[dm.rem]++;
        }
        if (i && memcmp(digits, previous_digits, sizeof(digits))) {
            return 0;
        }
        memcpy(previous_digits, digits, sizeof(digits));
    }
    return 1;
}

int main(void) {
    char array[10000] = { 0 };
    int triplets[3];
    size_t i, j;

    sieve(array, sizeof(array));
    for (i = 1000; i < 3334; i++) {
        if (array[i]) {
            continue;
        }
        for (j = 1000; j < 3334; j += 2) {
            if (array[i + j] || array[i + j * 2]) {
                continue;
            }
            triplets[0] = i;
            triplets[1] = i + j;
            triplets[2] = i + j * 2;
            if (!is_permuting(triplets, 3)) {
                continue;
            }
            if (triplets[0] == 1487 && triplets[1] == 4817 && triplets[2] == 8147) {
                continue;
            }
            goto finish;
        }
    }
finish:
    printf("%d%d%d\n", triplets[0], triplets[1], triplets[2]);
    return 0;
}

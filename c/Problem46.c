/*
 * It was proposed by Christian Goldbach that every odd composite number can be
 * written as the sum of a prime and twice a square.
 *
 * 9 = 7 + 2×1^2
 * 15 = 7 + 2×2^2
 * 21 = 3 + 2×3^2
 * 25 = 7 + 2×3^2
 * 27 = 19 + 2×2^2
 * 33 = 31 + 2×1^2
 *
 * It turns out that the conjecture was false.
 *
 * What is the smallest odd composite that cannot be written as the sum of a prime
 * and twice a square?
 */
#include <limits.h>
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

void sieve(char *array, size_t size) {
    array[0] = 1;
    array[1] = 1;
    size_t limit = (size_t)sqrt((double)size);
    size_t i, j;
    for (i = 2; i <= limit; i++) {
        if (!array[i]) {
            for (j = i * i; j < size; j += i) {
                array[j] = 1;
            }
        }
    }
}

bool is_twice_of_square(int x) {
    if (x & 1) {
        return false;
    }
    double integral;
    return !modf(sqrt(x / 2), &integral);
}

bool is_goldbach_composite(int x) {
    size_t size = (size_t)x + 1;
    char *sieved = calloc(size, sizeof(char));
    sieve(sieved, size);
    size_t i;
    for (i = 0; i < size; i++) {
        if (!sieved[i] && is_twice_of_square(x - i)) {
            free(sieved);
            return true;
        }
    }
    free(sieved);
    return false;
}

int main(void) {
    int i;
    for (i = 9; i < (INT_MAX - 1); i += 2) {
        if (!is_goldbach_composite(i)) {
            printf("%d\n", i);
            break;
        }
    }
    return 0;
}

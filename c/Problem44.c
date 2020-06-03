/*
 * Pentagonal numbers are generated by the formula, P[n]=n(3n−1)/2. The first ten
 * pentagonal numbers are:
 *
 * 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
 *
 * It can be seen that P[4] + P[7] = 22 + 70 = 92 = P[8]. However, their
 * difference, 70 − 22 = 48, is not pentagonal.
 *
 * Find the pair of pentagonal numbers, P[j] and P[k], for which their sum and
 * difference are pentagonal and D = |P[k] − P[j]| is minimised; what is the value
 * of D?
 */

#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

int pentagonal(int n) {
    return n * (3 * n - 1) >> 1;
}

bool is_pentagonal(int x) {
    double a = ((sqrt(24 * x + 1) + 1) / 6);
    return a == (int)a;
}

int main(void) {
    int *cache = NULL;
    int x;
    for (int i = 0; ; i++, x = pentagonal(i)) {
        int y;
        for (int j = i - 1; j > 0; j--, y = cache[j]) {
            if (is_pentagonal(x - y) && is_pentagonal(x + y)) {
                free(cache);
                printf("%d\n", x - y);
                return 0;
            }
        }
        cache = realloc(cache, (i + 1) * sizeof(int));
        cache[i] = x;
    }
    return 0;
}

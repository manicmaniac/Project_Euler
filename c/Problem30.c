/*
 * Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
 *
 * 1634 = 14 + 64 + 34 + 44
 * 8208 = 84 + 24 + 04 + 84
 * 9474 = 94 + 44 + 74 + 44
 * As 1 = 14 is not a sum it is not included.
 *
 * The sum of these numbers is 1634 + 8208 + 9474 = 19316.
 *
 * Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
 */

#include <stdio.h>
#include <stdlib.h>

#define POW5(x)  (long)(x * x * x * x * x)

int is_armstrong5(long x) {
    static const long pows[] = {
        0L, 1L, POW5(2), POW5(3), POW5(4), POW5(5), POW5(6), POW5(7), POW5(8), POW5(9)
    };
    long result = 0;
    ldiv_t dm;

    dm.quot = x;
    while (dm.quot && result <= x) {
        dm = ldiv(dm.quot, 10);
        result += pows[dm.rem];
    }
    return result == x;
}

int main(void) {
    long result = 0, i;

    for (i = 2; i < 6 * POW5(9); i++) {
        if (is_armstrong5(i)) {
            result += i;
        }
    }
    printf("%ld\n", result);
    return 0;
}

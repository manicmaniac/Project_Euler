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
#include <stdbool.h>

bool is_armstrong5(long x) {
#define POW5(x)  (long)(x * x * x * x * x)
    static const long pows[] = {
        0L, 1L, POW5(2), POW5(3), POW5(4), POW5(5), POW5(6), POW5(7), POW5(8), POW5(9)
    };
#undef POW5
    long acc = 0;
    ldiv_t dm = {
        .quot = x,
        .rem = 0
    };
    while (dm.quot && acc <= x) {
        dm = ldiv(dm.quot, 10);
        acc += pows[dm.rem];
    }
    return acc == x;
}

int main(int argc, char const* argv[]) {
    long acc = 0;
    long i;
    for (i = 2; i < 6 * 9 * 9 * 9 * 9 * 9; i++) {
        if (is_armstrong5(i)) {
            acc += i;
        }
    }
    printf("%ld\n", acc);
    return 0;
}


/*
 * Triangle, pentagonal, and hexagonal numbers are generated by the following
 * formulae:
 *
 * Triangle     T[n]=n(n+1)/2    1, 3, 6, 10, 15, ...
 * Pentagonal   P[n]=n(3n−1)/2   1, 5, 12, 22, 35, ...
 * Hexagonal    H[n]=n(2n−1)     1, 6, 15, 28, 45, ...
 *
 * It can be verified that T[285] = P[165] = H[143] = 40755.
 *
 * Find the next triangle number that is also pentagonal and hexagonal.
 */

#include <math.h>
#include <stdbool.h>
#include <stdio.h>

bool is_pentagonal(long x) {
    double a = (sqrt(24 * x + 1) + 1) / 6;
    return a == (long)a;
}

long hexagonal(int n) {
    return n * (n * 2 - 1);
}

int main(void) {
    for (int i = 0; ; i++) {
        long x = hexagonal(i);
        if (x > 40755 && is_pentagonal(x)) {
            printf("%ld\n", x);
            break;
        }
    }
    return 0;
}

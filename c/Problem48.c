/*
 * The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 *
 * Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 */

#include <stdio.h>

long lpowmod(long x, long y, long z) {
    if (!y) {
        return 1;
    }
    long t = 1;
    while (y--) {
        t *= x;
        t %= z;
    }
    return t;
}

int main(void) {
    long result = 0;
    for (long i = 1; i <= 1000; i++) {
        result += lpowmod(i, i, (long)1e11);
        result %= (long)1e10;
    }
    printf("%ld\n", result);
    return 0;
}

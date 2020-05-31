/*
 * The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 *
 * Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 */

#include <stdio.h>

long long llpowmod(long long x, long long y, long long z) {
    long long t = 1;

    if (!y) {
        return 1;
    }
    while (y--) {
        t *= x;
        t %= z;
    }
    return t;
}

int main(void) {
    long long i, result;

    result = 0;
    for (i = 1; i <= 1000; i++) {
        result += llpowmod(i, i, 100000000000);
        result %= 10000000000;
    }
    printf("%lld\n", result);
    return 0;
}

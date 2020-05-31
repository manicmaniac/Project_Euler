/*
 * The first known prime found to exceed one million digits was discovered in
 * 1999, and is a Mersenne prime of the form 2^6972593−1; it contains exactly
 * 2,098,960 digits. Subsequently other Mersenne primes, of the form 2^p−1, have
 * been found which contain more digits.
 *
 * However, in 2004 there was found a massive non-Mersenne prime which contains
 * 2,357,207 digits: 28433×2^7830457+1.
 *
 * Find the last ten digits of this prime number.
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
    printf("%lld\n", (28433 * llpowmod(2, 7830457, 10000000000) + 1) % 10000000000);
    return 0;
}

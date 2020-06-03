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

long lexp2mod(long x, long y) {
    if (!x) {
        return 1;
    }
    long t = 1;
    while (x--) {
        t <<= 1;
        t %= y;
    }
    return t;
}

int main(void) {
    printf("%ld\n", (28433 * lexp2mod(7830457, (long)1e10) + 1) % (long)1e10);
    return 0;
}

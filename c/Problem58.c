/*
 * Starting with 1 and spiralling anticlockwise in the following way, a square
 * spiral with side length 7 is formed.
 *
 * 37 36 35 34 33 32 31
 * 38 17 16 15 14 13 30
 * 39 18  5  4  3 12 29
 * 40 19  6  1  2 11 28
 * 41 20  7  8  9 10 27
 * 42 21 22 23 24 25 26
 * 43 44 45 46 47 48 49
 *
 * It is interesting to note that the odd squares lie along the bottom right
 * diagonal, but what is more interesting is that 8 out of the 13 numbers lying
 * along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.
 *
 * If one complete new layer is wrapped around the spiral above, a square spiral
 * with side length 9 will be formed. If this process is continued, what is the
 * side length of the square spiral for which the ratio of primes along both
 * diagonals first falls below 10%?
 */

#include <math.h>
#include <stdio.h>

int is_prime(int x) {
    int i;
    double sqrt_n;

    if (x == 2) {
        return 1;
    }
    if (x < 2 || x % 2 == 0) {
        return 0;
    }
    sqrt_n = sqrt(x);
    for (i = 3; i <= sqrt_n; i += 2) {
        if (x % i == 0) {
            return 0;
        }
    }
    return 1;
}

int main(int argc, const char *argv[]) {
    int primes_count;
    long i, j, x, d;

    primes_count = 0;
    x = 1;
    i = 1;
    for (d = 2; ; d += 2) {
        for (j = 0; j < 4; i++, j++, x += d) {
            if (is_prime(x)) {
                primes_count++;
            }
            if (x != 1 && primes_count * 10 < i) {
                goto finish;
            }
        }
    }
finish:
    printf("%d\n", (int)sqrt(x));
    return 0;
}

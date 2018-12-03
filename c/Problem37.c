/*
 * The number 3797 has an interesting property. Being prime itself, it is possible
 * to continuously remove digits from left to right, and remain prime at each
 * stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797,
 * 379, 37, and 3.
 *
 * Find the sum of the only eleven primes that are both truncatable from left to
 * right and right to left.
 *
 * NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int is_prime(int x) {
    int i, d = 2;

    if (x == 2) {
        return 1;
    }
    if (x < 2 || x % 2 == 0) {
        return 0;
    }
    while (d <= sqrt(x)) {
        if (x % d == 0) {
            return 0;
        } else {
            d++;
        }
    }
    return 1;
}

int is_truncatable_prime(int x) {
    int y, i;
    div_t dm;

    y = 0;
    dm.quot = x;
    for (i = 0; dm.quot > 0; i++) {
        if (!is_prime(dm.quot)) {
            return 0;
        }
        dm = div(dm.quot, 10);
        y += dm.rem * pow(10, i);
        if (!is_prime(y)) {
            return 0;
        }
    }
    return 1;
}


int main(int argc, const char *argv[]) {
    int i, count, sum;

    sum = 0;
    count = 0;
    for (i = 11; count < 11; i++) {
        if (is_truncatable_prime(i)) {
            sum += i;
            count++;
        }
    }
    printf("%d\n", sum);
    return 0;
}

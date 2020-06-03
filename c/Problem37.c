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
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

bool is_prime(int x) {
    int i, d = 2;
    if (x == 2) {
        return true;
    }
    if (x < 2 || x % 2 == 0) {
        return false;
    }
    while (d <= sqrt(x)) {
        if (x % d == 0) {
            return false;
        } else {
            d++;
        }
    }
    return true;
}

bool is_truncatable_prime(int x) {
    int y = 0;
    div_t dm = { .quot = x };
    for (int i = 0; dm.quot > 0; i++) {
        if (!is_prime(dm.quot)) {
            return false;
        }
        dm = div(dm.quot, 10);
        y += dm.rem * pow(10, i);
        if (!is_prime(y)) {
            return false;
        }
    }
    return true;
}


int main(void) {
    int sum = 0;
    int count = 0;
    for (int i = 11; count < 11; i++) {
        if (is_truncatable_prime(i)) {
            sum += i;
            count++;
        }
    }
    printf("%d\n", sum);
    return 0;
}

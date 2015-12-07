/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */

#include <stdio.h>

long gcd(long m, long n) {
    if (!n) {
        return m;
    }
    return gcd(n, m % n);
}

long lcm(long m, long n) {
    return m * n / gcd(m, n);
}

int main(int argc, const char *argv[]) {
    long res, i;

    for (res = i = 1; i <= 20; i++) {
        res = lcm(res, i);
    }
    printf("%ld\n", res);
    return 0;
}

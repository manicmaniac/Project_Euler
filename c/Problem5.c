/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */
#include <stdio.h>

long lgcd(long x, long y) {
    if (!y) {
        return x;
    }
    return lgcd(y, x % y);
}

long llcm(long x, long y) {
    return x * y / lgcd(x, y);
}

int main(int argc, char **argv) {
    long result = 1;
    long i;
    for (i = 1; i <= 20; i++) {
        result = llcm(result, i);
    }
    printf("%ld\n", result);
    return 0;
}

/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 *
 * What is the 10 001st prime number?
 */
#include <stdio.h>
#include <math.h>

int is_prime(int n) {
    int i;
    double sqrt_n;

    if (n == 2) {
        return 1;
    }
    if (n < 2 || n % 2 == 0) {
        return 0;
    }
    sqrt_n = sqrt(n);
    for (i = 3; i <= sqrt_n; i += 2) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

int main(int argc, const char *argv[]) {
    int count, i;

    count = i = 0;
    while (count <= 10000) {
        i++;
        if (is_prime(i)) {
            count ++;
        }
    }
    printf("%d\n", i);
    return 0;
}

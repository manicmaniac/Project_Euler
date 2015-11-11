/*
 * Euler discovered the remarkable quadratic formula:
 *
 * n² + n + 41
 *
 * It turns out that the formula will produce 40 primes for the consecutive values
 * n = 0 to 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is
 * divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible
 * by 41.
 *
 * The incredible formula  n² − 79n + 1601 was discovered, which produces 80
 * primes for the consecutive values n = 0 to 79. The product of the coefficients,
 * −79 and 1601, is −126479.
 *
 * Considering quadratics of the form:
 *
 *     n² + an + b, where |a| < 1000 and |b| < 1000
 *
 *     where |n| is the modulus/absolute value of n
 *     e.g. |11| = 11 and |−4| = 4
 *
 * Find the product of the coefficients, a and b, for the quadratic expression
 * that produces the maximum number of primes for consecutive values of n,
 * starting with n = 0.
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

bool is_prime(int n) {
    if (n == 2) {
        return true;
    }
    if (n < 2 || n % 2 == 0) {
        return false;
    }
    int i;
    double sqrt_n = sqrt(n);
    for (i = 3; i <= sqrt_n; i += 2) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

int *sieve(int limit, size_t *size) {
    enum {
        UNKNOWN = 0,
        NONPRIME
    };
    if (limit < 2) {
        return NULL;
    }
    char *search = (char *)calloc(limit, sizeof(char));
    search[0] = NONPRIME;
    search[1] = NONPRIME;
    int current;
    int i;
    double sqrt_limit = sqrt(limit);
    for (current = 2; current <= sqrt_limit; current++) {
        for (i = current << 1; i < limit; i += current) {
            search[i] = NONPRIME;
        }
    }
    *size = 0;
    int *sparse_res = (int *)malloc(limit * sizeof(int));
    for (i = 0; i < limit; i++) {
        if (search[i] == UNKNOWN) {
            sparse_res[*size] = i;
            *size += 1;
        }
    }
    free(search);
    int *res = (int *)malloc(*size * sizeof(int));
    memcpy(res, sparse_res, *size * sizeof(int));
    free(sparse_res);
    return res;
}

int count_quadratic_primes(int a, int b) {
    int count, i, x;

    count = 0;
    for (i = 0; i < b; i++) {
        x = i * i + a * i + b;
        if (is_prime(x)) {
            count++;
        } else {
            break;
        }
    }
    return count;
}

int main(int argc, char const *argv[]) {
    int a, b, current, longest, longest_product;
    size_t i, size;
    int *primes;

    primes = sieve(1000, &size);
    longest = 0;
    for (a = -999; a < 1000; a += 2) {
        for (i = 0; i < size; i++) {
            b = primes[i];
            current = count_quadratic_primes(a, b);
            if (longest < current) {
                longest = current;
                longest_product = a * b;
            }
        }
    }
    free(primes);
    printf("%d\n", longest_product);
    return 0;
}


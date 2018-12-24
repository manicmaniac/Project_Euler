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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int is_prime(int n) {
    if (n == 2) {
        return 1;
    }
    if (n < 2 || n % 2 == 0) {
        return 0;
    }
    int i;
    double sqrt_n = sqrt(n);
    for (i = 3; i <= sqrt_n; i += 2) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

int *sieve(int limit, size_t *size) {
    int *search, *result;
    int i, j;
    double sqrt_limit;

    if (limit < 2) {
        return NULL;
    }
    search = calloc(limit, sizeof(int));
    result = malloc(limit * sizeof(int));
    search[0] = 1;
    search[1] = 1;
    sqrt_limit = sqrt(limit);
    *size = 0;
    for (i = 2; i <= limit; i++) {
        if (!search[i]) {
            if (i <= sqrt_limit) {
                for (j = i << 1; j < limit; j += i) {
                    search[j] = 1;
                }
            }
            result[*size] = i;
            *size += 1;
        }
    }
    free(search);
    return realloc(result, *size * sizeof(int));
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

int main(int argc, const char *argv[]) {
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

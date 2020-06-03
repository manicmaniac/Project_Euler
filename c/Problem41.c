/*
 * We shall say that an n-digit number is pandigital if it makes use of all the
 * digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
 * also prime.
 * 
 * What is the largest n-digit pandigital prime that exists?
 */

#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

void swap(int *a, int *b) {
    int c = *a;
    *a = *b;
    *b = c;
}

void permutations(int *p, size_t n, void (*callback)(int *)) {
    if (n == 1) {
        callback(p);
        return;
    }
    for (size_t i = 0; i < n - 1; i++) {
        permutations(p, n - 1, callback);
        swap(&p[(n & 1 ? 0 : i)], &p[n - 1]);
    }
    permutations(p, n - 1, callback);
}

bool is_prime(int x) {
    if (x == 2) {
        return true;
    }
    if (x < 2 || !(x & 1)) {
        return false;
    }
    double sqrt_x = sqrt(x);
    for (int i = 3; i <= sqrt_x; i++) {
        if (!(x % i)) {
            return false;
        }
    }
    return true;
}

static void callback(int *p) {
    int x = 7000000 + p[0];
    for (size_t i = 5; i > 0; i--) {
        x += p[i] * pow(10, i);
    }
    if (is_prime(x)) {
        printf("%d\n", x);
        exit(0);
    }
}

int main(void) {
    int digits[] = {1, 2, 3, 4, 5, 6};
    permutations(digits, sizeof(digits) / sizeof(digits[0]), callback);
    return 0;
}

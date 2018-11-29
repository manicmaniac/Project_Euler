/*
 * There are exactly ten ways of selecting three from five, 12345:
 *
 * 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
 *
 * In combinatorics, we use the notation, ^5C[3] = 10.
 *
 * In general,
 *
 * ^nC[r] = n!       ,where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
 *          r!(n−r)!
 *
 * It is not until n = 23, that a value exceeds one-million: ^23C[10] = 1144066.
 *
 * How many, not necessarily distinct, values of  ^nC[r], for 1 ≤ n ≤ 100, are
 * greater than one-million?
 */
#include <stdio.h>
#include <math.h>

#define PI 3.14159265359
#define E 2.71828182846

double log_fac(int x) {
    return x * log(x) - x + log(2 * PI * x) / 2;
}

double log_ncr(int n, int r) {
    return log_fac(n) - log_fac(r) - log_fac(n - r);
}

int main(int argc, const char *argv[]) {
    int count, n, r;
    double limit;

    count = 0;
    limit = log10(1e6) / log10(E);
    for (n = 1; n <= 100; n++) {
        for (r = 1; r < n; r++) {
            if (log_ncr(n, r) >= limit) {
                count++;
            }
        }
    }
    printf("%d\n", count);
    return 0;
}

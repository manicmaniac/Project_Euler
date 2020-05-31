/*
 * The fraction ^49/[98] is a curious fraction, as an inexperienced mathematician
 * in attempting to simplify it may incorrectly believe that ^49/[98] = ^4/[8],
 * which is correct, is obtained by cancelling the 9s.
 *
 * We shall consider fractions like, ^30/[50] = ^3/[5], to be trivial examples.
 *
 * There are exactly four non-trivial examples of this type of fraction, less than
 * one in value, and containing two digits in the numerator and denominator.
 *
 * If the product of these four fractions is given in its lowest common terms,
 * find the value of the denominator.
 */

#include <stdio.h>

int main(void) {
    int i, j, k, d, n;
    double res_d, res_n;

    for (res_d = res_n = i = 1; i <= 9; i++) {
        for (j = 1; j <= 9; j++) {
            for (k = 1; k <= 9; k++) {
                d = i * 10 + j;
                n = j * 10 + k;
                if ((d / (double)n) == (i / (double)k)) {
                    res_d *= d;
                    res_n *= n;
                }
            }
        }
    }
    printf("%.lf\n", res_n / res_d);
    return 0;
}

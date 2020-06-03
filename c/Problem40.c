/*
 * An irrational decimal fraction is created by concatenating the positive
 * integers:
 *
 * 0.123456789101112131415161718192021...
 *
 * It can be seen that the 12^th digit of the fractional part is 1.
 *
 * If d[n] represents the n^th digit of the fractional part, find the value of the
 * following expression.
 *
 * d[1] × d[10] × d[100] × d[1000] × d[10000] × d[100000] × d[1000000]
 */

#include <math.h>
#include <stdio.h>

int digit_at(int x, int n) {
    int ndigits = 1;
    if (x > 0) {
        ndigits = (int)(log10(x)) + 1;
    }
    return x / (int)pow(10, ndigits - n - 1) % 10;
}

int champernowne_at(int n) {
    int ndigits = 1, i;
    n--;
    for (i = 1; n >= ndigits; i++) {
        ndigits = (int)(log10(i)) + 1;
        n -= ndigits;
    }
    return digit_at(i, n);
}

int main(void) {
    int product = 1;
    product *= champernowne_at(1);
    product *= champernowne_at(10);
    product *= champernowne_at(100);
    product *= champernowne_at(1000);
    product *= champernowne_at(10000);
    product *= champernowne_at(100000);
    product *= champernowne_at(1000000);
    printf("%d\n", product);
    return 0;
}

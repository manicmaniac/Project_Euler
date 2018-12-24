/*
 * A palindromic number reads the same both ways. The largest palindrome made from
 * the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int make_palindrome(int x) {
    int ndigits, palindrome, i;
    div_t dm;

    dm.quot = x;
    ndigits = (int)log10(x) + 1;
    palindrome = x * pow(10, ndigits);
    for (i = ndigits; dm.quot; i--) {
        dm = div(dm.quot, 10);
        palindrome += dm.rem * pow(10, i - 1);
    }
    return palindrome;
}

int is_product_of_ndigits(int x, int n) {
    int min, max, i;
    div_t dm;

    min = pow(10, n - 1);
    max = min * 10 - 1;
    for (i = max; i >= min; i--) {
        dm = div(x, i);
        if (!dm.rem) {
            return dm.quot >= min && dm.quot <= max;
        }
    }
    return 0;
}

int main(int argc, const char *argv[]) {
    int i, palindrome;

    for (i = 999; i > 100; i--) {
        palindrome = make_palindrome(i);
        if (is_product_of_ndigits(palindrome, 3)) {
            break;
        }
    }
    printf("%d\n", palindrome);
    return 0;
}

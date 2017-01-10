/*
 * A palindromic number reads the same both ways. The largest palindrome made from
 * the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

int make_palindrome(int x) {
    div_t dm = {
        .quot = x,
        .rem = 0
    };
    int ndigits = (int)log10(x) + 1;
    int palindrome = x * pow(10, ndigits);
    int i;
    for (i = ndigits; dm.quot; i--) {
        dm = div(dm.quot, 10);
        palindrome += dm.rem * pow(10, i - 1);
    }
    return palindrome;
}

bool is_product_of_ndigits(int x, int n) {
    int min = pow(10, n - 1);
    int max = min * 10 - 1;
    int i;
    for (i = max; i >= min; i--) {
        div_t dm = div(x, i);
        if (!dm.rem) {
            return dm.quot >= min && dm.quot <= max;
        }
    }
    return false;
}

int main(int argc, char **argv) {
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

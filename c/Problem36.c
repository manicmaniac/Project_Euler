/*
 * The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.
 *
 * Find the sum of all numbers, less than one million, which are palindromic in
 * base 10 and base 2.
 *
 * (Please note that the palindromic number, in either base, may not include
 * leading zeros.)
 */

#include <stdio.h>
#include <stdlib.h>

int is_bin_palindromic(int x) {
    int reversed_x;
    int temp;

    if (x & 1) {
        reversed_x = 0;
        temp = x;
        while (temp) {
            reversed_x <<= 1;
            reversed_x |= temp & 1;
            temp >>= 1;
        }
        return x == reversed_x;
    }
    return 0;
}

int is_decimal_palindromic(int x) {
    int reversed_x;
    div_t dm;

    if (x % 10) {
        reversed_x = 0;
        dm.quot = x;
        while (dm.quot) {
            reversed_x *= 10;
            dm = div(dm.quot, 10);
            reversed_x += dm.rem;
        }
        return x == reversed_x;
    }
    return 0;
}

int main(int argc, const char *argv[]) {
    int i, result;

    result = 0;
    for (i = 0; i < 1000000; i++) {
        if (is_decimal_palindromic(i) && is_bin_palindromic(i)) {
            result += i;
        }
    }
    printf("%d\n", result);
    return 0;
}

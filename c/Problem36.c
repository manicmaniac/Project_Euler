/*
 * The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.
 *
 * Find the sum of all numbers, less than one million, which are palindromic in
 * base 10 and base 2.
 *
 * (Please note that the palindromic number, in either base, may not include
 * leading zeros.)
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

bool is_bin_palindromic(int x) {
    if (x & 1) {
        int reversed_x = 0;
        int temp = x;
        while (temp) {
            reversed_x <<= 1;
            reversed_x |= temp & 1;
            temp >>= 1;
        }
        return x == reversed_x;
    }
    return false;
}

bool is_decimal_palindromic(int x) {
    if (x % 10) {
        int reversed_x = 0;
        div_t dm = { .quot = x };
        while (dm.quot) {
            reversed_x *= 10;
            dm = div(dm.quot, 10);
            reversed_x += dm.rem;
        }
        return x == reversed_x;
    }
    return false;
}

int main(void) {
    int result = 0;
    for (int i = 0; i < 1000000; i++) {
        if (is_decimal_palindromic(i) && is_bin_palindromic(i)) {
            result += i;
        }
    }
    printf("%d\n", result);
    return 0;
}

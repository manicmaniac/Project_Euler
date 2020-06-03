/*
 * 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 *
 * Find the sum of all numbers which are equal to the sum of the factorial of their digits.
 *
 * Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 */

#include <stdio.h>
#include <stdlib.h>

int is_factorion(int x) {
    static const int factorials[] = { 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880 };
    int res = 0;
    div_t dm = { .quot = x };
    while (dm.quot && res <= x) {
        dm = div(dm.quot, 10);
        res += factorials[dm.rem];
    }
    return x == res;
}

int main(void) {
    int result = 0;
    for (int i = 3; i < 362880 * 7; i++) {
        if (is_factorion(i)) {
            result += i;
        }
    }
    printf("%d\n", result);
    return 0;
}

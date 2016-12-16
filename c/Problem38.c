/*
 * Take the number 192 and multiply it by each of 1, 2, and 3:
 *
 * 192  1 = 192
 * 192  2 = 384
 * 192  3 = 576
 * By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
 *
 * The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
 *
 * What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n  1?
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

bool is_pandigital(int n) {
    int flags, d;
    div_t dm;
    if (n % 9) {
        return false;
    }
    flags = 1;
    while (n) {
        dm = div(n, 10);
        n = dm.quot;
        d = dm.rem;
        flags |= 1 << d;
    }
    return flags == 0x3ff;
}

int concat(int x, int y) {
    int r;
    r = (int)log10(y) + 1;
    return x * pow(10, r) + y;
}

int main(int argc, const char *argv[]) {
    const int limit = 9877;
    int max, i, j, acc;
    max = 0;
    for (i = 0; i < limit; i++) {
        acc = 0;
        for (j = 1; j < 10; j++) {
            acc = concat(acc, i * j);
            if (acc > 999999999) {
                break;
            }
            if (is_pandigital(acc) && max < acc) {
                max = acc;
                break;
            }
        }
    }
    printf("%d\n", max);
    return 0;
}


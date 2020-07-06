 /*
 * The first two consecutive numbers to have two distinct prime factors are:
 *
 * 14 = 2 × 7
 * 15 = 3 × 5
 *
 * The first three consecutive numbers to have three distinct prime factors are:
 *
 * 644 = 2² × 7 × 23
 * 645 = 3 × 5 × 43
 * 646 = 2 × 17 × 19.
 *
 * Find the first four consecutive integers to have four distinct prime factors
 * each. What is the first of these numbers?
 */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int count_distinct_factors(int x) {
    int count = 0;
    for (int d = 2; x >= d;) {
        div_t dm = div(x, d);
        if (dm.rem) {
            d++;
        } else {
            do {
                x = dm.quot;
                dm = div(x, d);
            } while (dm.rem == 0);
            count++;
        }
    }
    return count;
}

int main(void) {
    int i = 0;
    for (int counter = 0; counter < 4; i++) {
        if (count_distinct_factors(i) == 4) {
            counter++;
        } else {
            counter = 0;
        }
    }
    printf("%d\n", i - 4);
    return 0;
}

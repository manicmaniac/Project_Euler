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
    unsigned char *cache = calloc(x, 1);
    div_t dm = { .quot = x };
    for (int d = 2; x >= d;) {
        dm = div(x, d);
        if (dm.rem) {
            d++;
        } else {
            if (!cache[d]) {
                cache[d] = 1;
                count++;
            }
            x = dm.quot;
        }
    }
    free(cache);
    return count;
}

int main(void) {
    int i = 0;
    while (1) {
        if ((count_distinct_factors(i) == 4) &&
                count_distinct_factors(i + 1) == 4 &&
                count_distinct_factors(i + 2) == 4 &&
                count_distinct_factors(i + 3) == 4) {
            break;
        }
        i++;
    }
    printf("%d\n", i);
    return 0;
}

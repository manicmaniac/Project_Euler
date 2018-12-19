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
    int d = 2, count = 0;
    div_t dm = { 0 };
    unsigned char *cache;

    cache = calloc(x, 1);
    dm.quot = x;
    while (x >= d) {
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

int main(int argc, const char *argv[]) {
    int i;

    for (i = 0; ; i++) {
        if ((count_distinct_factors(i) == 4) &&
                count_distinct_factors(i + 1) == 4 &&
                count_distinct_factors(i + 2) == 4 &&
                count_distinct_factors(i + 3) == 4) {
            break;
        }
    }
    printf("%d\n", i);
    return 0;
}

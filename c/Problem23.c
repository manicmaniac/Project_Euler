/*
 * A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
 *
 * A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
 *
 * As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
 *
 * Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int is_abundant(int x) {
    char *array;
    int limit, i, sum;
    div_t dm;

    array = calloc(x, sizeof(char));
    limit = (int)sqrt(x);
    for (i = 2; i <= limit; i++) {
        dm = div(x, i);
        if (!dm.rem) {
            array[i] = 1;
            array[dm.quot] = 1;
        }
    }
    sum = 0;
    for (i = 0; i < x; i++) {
        if (array[i]) {
            sum += i;
        }
    }
    free(array);
    return sum > x;
}

#define LIMIT 28123

int main(int argc, const char *argv[]) {
    int i, j, abundants_count, abundants[LIMIT], sum_of_2_abundants[LIMIT], sum;

    abundants_count = 0;
    for (i = 0; i <= sizeof(abundants) / sizeof(abundants[0]); i++) {
        if (is_abundant(i)) {
            abundants[abundants_count] = i;
            abundants_count++;
        }
    }
    for (i = 0; i < abundants_count; i++) {
        for (j = i; j < abundants_count; j++) {
            sum = abundants[i] + abundants[j];
            if (sum > LIMIT) {
                break;
            }
            sum_of_2_abundants[sum] = 1;
        }
    }
    sum = 0;
    for (i = 0; i < LIMIT; i++) {
        if (!sum_of_2_abundants[i]) {
            sum += i;
        }
    }
    printf("%d\n", sum);
    return 0;
}

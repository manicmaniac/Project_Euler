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
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

bool is_abundant(int x) {
    if (x < 12) {
        return false;
    }
    int limit = (int)sqrt(x);
    int sum = 1;
    for (int i = 2; i <= limit; i++) {
        div_t dm = div(x, i);
        if (!dm.rem) {
            sum += i;
            if (i != dm.quot) {
                sum += dm.quot;
            }
        }
    }
    return sum > x;
}

void sieve_abundants(char *array, size_t limit) {
    for (size_t i = 0; i < limit; i++) {
        if (!array[i] && is_abundant(i)) {
            for (size_t j = i; j < limit; j += i) {
                array[j] = 1;
            }
        }
    }
}

#define LIMIT 28123

int main(void) {
    static char array[LIMIT] = { 0 };
    static int abundants[LIMIT], sum_of_2_abundants[LIMIT];
    sieve_abundants(array, LIMIT);
    size_t abundants_count = 0;
    for (size_t i = 0; i < LIMIT; i++) {
        if (array[i]) {
            abundants[abundants_count] = i;
            abundants_count++;
        }
    }
    for (size_t i = 0; i < abundants_count; i++) {
        for (size_t j = i; j < abundants_count; j++) {
            int sum = abundants[i] + abundants[j];
            if (sum > LIMIT) {
                break;
            }
            sum_of_2_abundants[sum] = 1;
        }
    }
    int sum = 0;
    for (size_t i = 0; i < LIMIT; i++) {
        if (!sum_of_2_abundants[i]) {
            sum += i;
        }
    }
    printf("%d\n", sum);
    return 0;
}

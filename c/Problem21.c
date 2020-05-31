/*
 * Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
 * If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.
 *
 * For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
 *
 * Evaluate the sum of all the amicable numbers under 10000.
 */

#include <stdbool.h>
#include <stdio.h>

int sum_of_divisors(int x) {
    int result = 0;
    for (int i = 1; i < (x / 2 + 1); i++) {
        if (x % i == 0) {
            result += i;
        }
    }
    return result;
}

bool has_amicable(int x) {
    int sum = sum_of_divisors(x);
    return sum != x && sum_of_divisors(sum) == x;
}

int main(void) {
    int result = 0;
    for (int i = 2; i < 10000; i++) {
        if (has_amicable(i)) {
            result += i;
        }
    }
    printf("%d\n", result);
    return 0;
}

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

void sieve_sum_of_proper_divisors(int *zeros, size_t size) {
    for (int i = 1; i < size; i++) {
        for (int j = i * 2; j < size; j += i) {
            zeros[j] += i;
        }
    }
}

bool has_amicable_pair(int x, int *sum_of_proper_divisors, size_t size) {
    if (x >= size) {
        return false;
    }
    int y = sum_of_proper_divisors[x];
    if (y >= size || x == y) {
        return false;
    }
    return x == sum_of_proper_divisors[y];
}

int main(void) {
#define N 10000
    int numbers[N] = { 0 };
    sieve_sum_of_proper_divisors(numbers, N);
    int sum = 0;
    for (int i = 0; i < N; i++) {
        if (has_amicable_pair(i, numbers, N)) {
            sum += i;
        }
    }
    printf("%d\n", sum);
    return 0;
}

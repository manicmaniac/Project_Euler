/*
 * Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF
 * (n,d)=1, it is called a reduced proper fraction.
 * 
 * If we list the set of reduced proper fractions for d ≤ 8 in ascending order of
 * size, we get:
 * 
 * 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7,
 * 3/4, 4/5, 5/6, 6/7, 7/8
 * 
 * It can be seen that there are 21 elements in this set.
 * 
 * How many elements would be contained in the set of reduced proper fractions for
 * d ≤ 1,000,000?
 */

#include <math.h>
#include <stdio.h>

void sieve(char *array, size_t size) {
    array[0] = 1;
    array[1] = 1;
    size_t limit = (size_t)sqrt((double)size);
    for (size_t i = 2; i <= limit; i++) {
        if (!array[i]) {
            for (size_t j = i * i; j < size; j += i) {
                array[j] = 1;
            }
        }
    }
}

int main(void) {
#define N 1000001
    static char array[N] = { 0 };
    sieve(array, N);
    static long totients[N] = { 0 };
    static const long undefined = -1;
    for (size_t i = 2; i < N; i++) {
        totients[i] = undefined;
    }
    for (size_t i = 0; i < N; i++) {
        if (array[i]) {
            continue;
        }
        for (size_t j = i; j < N; j += i) {
            if (totients[j] == undefined) {
                totients[j] = i - 1;
            } else {
                totients[j] *= i - 1;
            }
        }
        for (size_t i2 = i * i; i2 < N; i2 *= i) {
            for (size_t j = i2; j < N; j += i2) {
                totients[j] *= i;
            }
        }
    }
    long sum = 0;
    for (size_t i = 0; i < N; i++) {
        sum += totients[i];
    }
    printf("%ld\n", sum);
    return 0;
}

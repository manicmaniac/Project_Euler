/*
 * The Fibonacci sequence is defined by the recurrence relation:
 * 
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 * 
 * Hence the first 12 terms will be:
 * 
 *     F[1] = 1
 *     F[2] = 1
 *     F[3] = 2
 *     F[4] = 3
 *     F[5] = 5
 *     F[6] = 8
 *     F[7] = 13
 *     F[8] = 21
 *     F[9] = 34
 *     F[10] = 55
 *     F[11] = 89
 *     F[12] = 144
 * 
 * The 12th term, F[12], is the first term to contain three digits.
 * 
 * What is the first term in the Fibonacci sequence to contain 1000 digits?
 */
#include <stdio.h>

#define LOG10_SQRT5 0.349485002168
#define LOG10_PHI   0.20898764025

int fib_digits(int n) {
    return (int)(n * LOG10_PHI - LOG10_SQRT5) + 1;
}

int main(int argc, char const* argv[]) {
    int i, res;
    for (i = 0; (res = fib_digits(i) - 1000); i -= res);
    printf("%d\n", i);
    return 0;
}


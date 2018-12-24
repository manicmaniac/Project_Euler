/*
 * A permutation is an ordered arrangement of objects. For example, 3124 is one
 * possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
 * are listed numerically or alphabetically, we call it lexicographic order. The
 * lexicographic permutations of 0, 1 and 2 are:
 *
 * 012   021   102   120   201   210
 *
 * What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5,
 * 6, 7, 8 and 9?
 */

#include <stdio.h>

int factorial(int x) {
    int acc;

    for (acc = 1; x > 0; x--) {
        acc *= x;
    }
    return acc;
}

void permutation_at(int *xs, size_t count, int n) {
    int m, index, x, i;

    if (count < 2) {
        return;
    }
    m = factorial(count - 1);
    index = n / m;
    x = xs[index];
    for (i = index; i > 0; i--) {
        xs[i] = xs[i - 1];
    }
    xs[0] = x;
    permutation_at(xs + 1, count - 1, n - m * index);
}

int main(int argc, const char *argv[]) {
    int i;
    int digits[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

    permutation_at(digits, 10, 999999);
    for (i = 0; i < 10; i++) {
        printf("%d", digits[i]);
    }
    printf("\n");
    return 0;
}

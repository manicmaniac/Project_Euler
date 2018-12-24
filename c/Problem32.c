/*
 * We shall say that an n-digit number is pandigital if it makes use of all the
 * digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
 * through 5 pandigital.
 *
 * The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
 * multiplicand, multiplier, and product is 1 through 9 pandigital.
 *
 * Find the sum of all products whose multiplicand/multiplier/product identity can
 * be written as a 1 through 9 pandigital.
 *
 * HINT: Some products can be obtained in more than one way so be sure to only
 * include it once in your sum.
 */

#include <stdio.h>
#include <stdbool.h>

void swap(int *a, int *b) {
    int c;

    c = *a;
    *a = *b;
    *b = c;
}

void permutations(int *p, size_t n, void (*callback)(int *, void *), void *context) {
    size_t i;

    if (n == 1) {
        return callback(p, context);
    }
    for (i = 0; i < n - 1; i++) {
        permutations(p, n - 1, callback, context);
        swap(&p[(n & 1 ? 0 : i)], &p[n - 1]);
    }
    permutations(p, n - 1, callback, context);
}

int digits_concatenate(int *digits, size_t start, size_t stop) {
    int concatenated;
    size_t i;

    concatenated = 0;
    for (i = start; i < stop; i++) {
        concatenated *= 10;
        concatenated += digits[i];
    }
    return concatenated;
}

static void callback(int *digits, void *context) {
    int multiplier, multiplicand, product;

    product = digits_concatenate(digits, 5, 9);
    if (!((bool *)context)[product]) {
        multiplier = digits[0];
        multiplicand = digits_concatenate(digits, 1, 5);
        if (multiplier * multiplicand == product) {
            ((bool *)context)[product] = true;
        } else {
            multiplier = digits_concatenate(digits, 0, 2);
            multiplicand = digits_concatenate(digits, 2, 5);
            if (multiplier * multiplicand == product) {
                ((bool *)context)[product] = true;
            }
        }
    }
}

int main(int argc, const char *argv[]) {
    int sum;
    int digits[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
    bool context[9999] = {false};
    size_t i;

    permutations(digits, 9, callback, &context);
    sum = 0;
    for (i = 0; i < 9999; i++) {
        if (context[i]) {
            sum += i;
        }
    }
    printf("%d\n", sum);
    return 0;
}

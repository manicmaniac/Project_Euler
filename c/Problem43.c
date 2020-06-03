/*
 * The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
 * each of the digits 0 to 9 in some order, but it also has a rather interesting
 * sub-string divisibility property.
 *
 * Let d[1] be the 1^st digit, d[2] be the 2^nd digit, and so on. In this way, we
 * note the following:
 *
 *   • d[2]d[3]d[4]=406 is divisible by 2
 *   • d[3]d[4]d[5]=063 is divisible by 3
 *   • d[4]d[5]d[6]=635 is divisible by 5
 *   • d[5]d[6]d[7]=357 is divisible by 7
 *   • d[6]d[7]d[8]=572 is divisible by 11
 *   • d[7]d[8]d[9]=728 is divisible by 13
 *   • d[8]d[9]d[10]=289 is divisible by 17
 *
 * Find the sum of all 0 to 9 pandigital numbers with this property.
 */

#include <math.h>
#include <stdio.h>

void swap(int *a, int *b) {
    int c = *a;
    *a = *b;
    *b = c;
}

void permutations(int *p, size_t n, void *ctx, void (*callback)(int *, void *)) {
    if (n == 1) {
        callback(p, ctx);
        return;
    }
    for (size_t i = 0; i < n - 1; i++) {
        permutations(p, n - 1, ctx, callback);
        swap(&p[(n & 1 ? 0 : i)], &p[n - 1]);
    }
    permutations(p, n - 1, ctx, callback);
}

static void callback(int *p, void *ctx) {
    if (!(
        !p[0]
        || p[3] & 1
        || (p[2] + p[3] + p[4]) % 3
        || p[5] != 5
        || (p[4] * 100 + p[5] * 10 + p[6]) % 7
        || (p[5] * 100 + p[6] * 10 + p[7]) % 11
        || (p[6] * 100 + p[7] * 10 + p[8]) % 13
        || (p[7] * 100 + p[8] * 10 + p[9]) % 17
    )) {
        for (int i = 0; i < 10; i++) {
            *(long *)ctx += p[i] * pow(10, 9 - i);
        }
    };
}

int main(void) {
    int digits[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    long result = 0;
    permutations(digits, 10, &result, callback);
    printf("%ld\n", result);
    return 0;
}

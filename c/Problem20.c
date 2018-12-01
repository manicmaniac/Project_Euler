/*
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 *
 * For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 * and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
 *
 * Find the sum of the digits in the number 100!
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    int *digits;
    size_t digits_count;
} bignum;

bignum *bignum_new(int x) {
    bignum *a;
    size_t digits_count, i;
    div_t dm;

    digits_count = (size_t)log10(x) + 1;
    a = malloc(sizeof(bignum));
    a->digits_count = digits_count;
    a->digits = calloc(digits_count, sizeof(int));
    dm.quot = x;
    for (i = 0; i < digits_count; i++) {
        dm = div(dm.quot, 10);
        a->digits[i] = dm.rem;
    }
    return a;
}

bignum *bignum_copy(bignum *a) {
    bignum *b;

    b = malloc(sizeof(bignum));
    b->digits_count = a->digits_count;
    b->digits = malloc(b->digits_count * sizeof(int));
    memcpy(b->digits, a->digits, b->digits_count * sizeof(int));
    return b;
}

void bignum_delete(bignum *a) {
    free(a->digits);
    free(a);
}

void bignum_carry(bignum *a) {
    size_t i;
    div_t dm;

    for (i = 0; i < a->digits_count; i++) {
        if (a->digits[i] > 9) {
            if (a->digits_count < i + 1) {
                a->digits_count = i + 1;
                a->digits = realloc(a->digits, a->digits_count * sizeof(int));
                a->digits[a->digits_count - 1] = 0;
            }
            dm = div(a->digits[i], 10);
            a->digits[i] = dm.rem;
            a->digits[i + 1] += dm.quot;
        }
    }
}

void bignum_string(const bignum *a, char *buf, size_t len) {
    size_t limit, i;

    limit = (a->digits_count < len ? a->digits_count : len);
    for (i = 0; i < limit; i++) {
        buf[i] = a->digits[a->digits_count - i - 1] + '0';
    }
    if (limit > 0) {
        buf[limit] = 0;
    }
}

void bignum_mul(bignum *a, const bignum *b) {
    bignum c;
    size_t i, j, leading_zeros;

    c.digits_count = a->digits_count + b->digits_count;
    c.digits = calloc(c.digits_count, sizeof(int));
    for (i = 0; i < a->digits_count; i++) {
        for (j = 0; j < b->digits_count; j++) {
            c.digits[i + j] += a->digits[i] * b->digits[j];
        }
    }
    free(a->digits);
    a->digits = c.digits;
    a->digits_count = c.digits_count;
    bignum_carry(a);
    leading_zeros = 0;
    for (i = 0; i < a->digits_count; i++) {
        if (a->digits[a->digits_count - i - 1] == 0) {
            leading_zeros++;
        } else {
            break;
        }
    }
    a->digits_count -= leading_zeros;
    a->digits = realloc(a->digits, a->digits_count * sizeof(int));
}


int main(int argc, char const* argv[]) {
    bignum *a, *b;
    size_t i;
    int sum;

    a = bignum_new(1);
    for (i = 2; i <= 100; i++) {
        b = bignum_new(i);
        bignum_mul(a, b);
        bignum_delete(b);
    }
    bignum_delete(a);
    sum = 0;
    for (i = 0; i < a->digits_count; i++) {
        sum += a->digits[i];
    }
    printf("%d\n", sum);
    return 0;
}

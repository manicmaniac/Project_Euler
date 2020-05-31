/*
 * 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 *
 * What is the sum of the digits of the number 2^1000?
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char *digits;
    size_t digits_count;
} bignum;

bignum *bignum_new(int x) {
    size_t digits_count = (size_t)log10(x) + 1;
    bignum *a = malloc(sizeof(bignum));
    a->digits_count = digits_count;
    a->digits = calloc(digits_count, sizeof(a->digits[0]));
    div_t dm = { .quot = x };
    for (size_t i = 0; i < digits_count; i++) {
        dm = div(dm.quot, 10);
        a->digits[i] = dm.rem;
    }
    return a;
}

bignum *bignum_copy(bignum *a) {
    bignum *b = malloc(sizeof(bignum));
    b->digits_count = a->digits_count;
    b->digits = malloc(b->digits_count * sizeof(b->digits[0]));
    memcpy(b->digits, a->digits, b->digits_count * sizeof(b->digits[0]));
    return b;
}

void bignum_delete(bignum *a) {
    free(a->digits);
    free(a);
}

void bignum_carry(bignum *a) {
    for (size_t i = 0; i < a->digits_count; i++) {
        if (a->digits[i] > 9) {
            if (a->digits_count < i + 1) {
                a->digits_count = i + 1;
                a->digits = realloc(a->digits, a->digits_count * sizeof(a->digits[0]));
                a->digits[a->digits_count - 1] = 0;
            }
            div_t dm = div(a->digits[i], 10);
            a->digits[i] = dm.rem;
            a->digits[i + 1] += dm.quot;
        }
    }
}

void bignum_string(const bignum *a, char *buf, size_t len) {
    size_t limit = (a->digits_count < len ? a->digits_count : len);
    for (size_t i = 0; i < limit; i++) {
        buf[i] = a->digits[a->digits_count - i - 1] + '0';
    }
    if (limit > 0) {
        buf[limit] = 0;
    }
}

void bignum_mul(bignum *a, const bignum *b) {
    bignum c = { .digits_count = a->digits_count + b->digits_count };
    c.digits = calloc(c.digits_count, sizeof(c.digits[0]));
    for (size_t i = 0; i < a->digits_count; i++) {
        for (size_t j = 0; j < b->digits_count; j++) {
            c.digits[i + j] += a->digits[i] * b->digits[j];
        }
    }
    free(a->digits);
    a->digits = c.digits;
    a->digits_count = c.digits_count;
    bignum_carry(a);
    size_t leading_zeros = 0;
    for (size_t i = 0; i < a->digits_count; i++) {
        if (a->digits[a->digits_count - i - 1] == 0) {
            leading_zeros++;
        } else {
            break;
        }
    }
    a->digits_count -= leading_zeros;
    a->digits = realloc(a->digits, a->digits_count * sizeof(a->digits[0]));
}

void bignum_pow(bignum *a, int exp) {
    if (exp == 0) {
        a->digits_count = 1;
        a->digits = realloc(a->digits, sizeof(a->digits[0]));
        a->digits[0] = 1;
        return;
    } else if (exp == 1) {
        return;
    }
    bignum *b = bignum_copy(a);
    for (int i = 1; i < exp; i++) {
        bignum_mul(a, b);
    }
    bignum_delete(b);
}

int main(void) {
    bignum *a = bignum_new(2);
    bignum_pow(a, 1000);
    int sum = 0;
    for (size_t i = 0; i < a->digits_count; i++) {
        sum += a->digits[i];
    }
    bignum_delete(a);
    printf("%d\n", sum);
    return 0;
}

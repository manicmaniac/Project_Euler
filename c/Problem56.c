/*
 * A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^
 * 100 is almost unimaginably large: one followed by two-hundred zeros. Despite
 * their size, the sum of the digits in each number is only 1.
 *
 * Considering natural numbers of the form, a^b, where a, b < 100, what is the
 * maximum digital sum?
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX(x, y) ((x) > (y) ? (x) : (y))

typedef struct {
    int *digits;
    size_t digits_count;
} bignum;

bignum *bignum_new(int x) {
    size_t digits_count = (size_t)log10(x) + 1;
    bignum *a = malloc(sizeof(bignum));
    a->digits_count = digits_count;
    a->digits = calloc(digits_count, sizeof(int));
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
    b->digits = malloc(b->digits_count * sizeof(int));
    memcpy(b->digits, a->digits, b->digits_count * sizeof(int));
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
                a->digits = realloc(a->digits, a->digits_count * sizeof(int));
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
    bignum c;
    c.digits_count = a->digits_count + b->digits_count;
    c.digits = calloc(c.digits_count, sizeof(int));
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
    a->digits = realloc(a->digits, a->digits_count * sizeof(int));
}

void bignum_pow(bignum *a, int exp) {
    if (exp == 0) {
        a->digits_count = 1;
        a->digits = realloc(a->digits, sizeof(int));
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
    int max_sum = 0;
    for (size_t a = 1; a < 100; a++) {
        for (size_t b = 1; b < 100; b++) {
            bignum *big_a = bignum_new(a);
            bignum_pow(big_a, b);
            int sum = 0;
            for (size_t i = 0; i < big_a->digits_count; i++) {
                sum += big_a->digits[i];
            }
            bignum_delete(big_a);
            max_sum = MAX(max_sum, sum);
        }
    }
    printf("%d\n", max_sum);
    return 0;
}

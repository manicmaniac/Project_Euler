/*
 * If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.
 *
 * Not all numbers produce palindromes so quickly. For example,
 *
 * 349 + 943 = 1292,
 * 1292 + 2921 = 4213
 * 4213 + 3124 = 7337
 *
 * That is, 349 took three iterations to arrive at a palindrome.
 *
 * Although no one has proved it yet, it is thought that some numbers, like 196,
 * never produce a palindrome. A number that never forms a palindrome through the
 * reverse and add process is called a Lychrel number. Due to the theoretical
 * nature of these numbers, and for the purpose of this problem, we shall assume
 * that a number is Lychrel until proven otherwise. In addition you are given that
 * for every number below ten-thousand, it will either (i) become a palindrome in
 * less than fifty iterations, or, (ii) no one, with all the computing power that
 * exists, has managed so far to map it to a palindrome. In fact, 10677 is the
 * first number to be shown to require over fifty iterations before producing a
 * palindrome: 4668731596684224866951378664 (53 iterations, 28-digits).
 *
 * Surprisingly, there are palindromic numbers that are themselves Lychrel
 * numbers; the first example is 4994.
 *
 * How many Lychrel numbers are there below ten-thousand?
 *
 * NOTE: Wording was modified slightly on 24 April 2007 to emphasise the
 * theoretical nature of Lychrel numbers.
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

bignum *bignum_copy(const bignum *a) {
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

static void bignum_remove_leading_zeros(bignum *a) {
    size_t i, leading_zeros;

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

void bignum_add(bignum *a, const bignum *b) {
    bignum c;
    size_t i, j;

    c.digits_count = 1 + (a->digits_count > b->digits_count ? a->digits_count : b->digits_count);
    c.digits = calloc(c.digits_count, sizeof(int));
    if (a->digits_count > b->digits_count) {
        memcpy(c.digits, a->digits, a->digits_count * sizeof(int));
        for (i = 0; i < b->digits_count; i++) {
            c.digits[i] += b->digits[i];
        }
    } else {
        memcpy(c.digits, b->digits, b->digits_count * sizeof(int));
        for (i = 0; i < a->digits_count; i++) {
            c.digits[i] += a->digits[i];
        }
    }
    free(a->digits);
    a->digits = c.digits;
    a->digits_count = c.digits_count;
    bignum_carry(a);
    bignum_remove_leading_zeros(a);
}

int bignum_is_palindrome(const bignum *a) {
    size_t i;

    for (i = 0; i < a->digits_count / 2; i++) {
        if (a->digits[i] != a->digits[a->digits_count - i - 1]) {
            return 0;
        }
    }
    return 1;
}

void bignum_reverse_digits(bignum *a) {
    size_t i;
    int tmp;

    for (i = 0; i < a->digits_count / 2; i++) {
        tmp = a->digits[i];
        a->digits[i] = a->digits[a->digits_count - i - 1];
        a->digits[a->digits_count - i - 1] = tmp;
    }
    bignum_remove_leading_zeros(a);
}

int bignum_is_lychrel(const bignum *a, int tries) {
    bignum *b, *c;
    int i, result = 1;

    b = bignum_copy(a);
    for (i = 0; i < tries; i++) {
        c = bignum_copy(b);
        bignum_reverse_digits(b);
        bignum_add(b, c);
        bignum_delete(c);
        if (bignum_is_palindrome(b)) {
            result = 0;
            break;
        }
    }
    bignum_delete(b);
    return result;
}

int main(void) {
    int a, count;
    bignum *big_a;

    count = 0;
    for (a = 1; a <= 10000; a++) {
        big_a = bignum_new(a);
        if (bignum_is_lychrel(big_a, 50)) {
            count++;
        }
        bignum_delete(big_a);
    }
    printf("%d\n", count);
    return 0;
}

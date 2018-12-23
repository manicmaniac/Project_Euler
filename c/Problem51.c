/*
 * By replacing the 1^st digit of the 2-digit number *3, it turns out that six of
 * the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
 *
 * By replacing the 3^rd and 4^th digits of 56**3 with the same digit, this
 * 5-digit number is the first example having seven primes among the ten generated
 * numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and
 * 56993. Consequently 56003, being the first member of this family, is the
 * smallest prime with this property.
 *
 * Find the smallest prime which, by replacing part of the number (not necessarily
 * adjacent digits) with the same digit, is part of an eight prime value family.
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int is_prime(int x) {
    int i, sqrt_x;

    if (x == 2) {
        return 1;
    }
    if (x < 2 || x % 2 == 0) {
        return 0;
    }
    sqrt_x = (int)sqrt(x);
    for (i = 3; i <= sqrt_x; i += 2) {
        if (x % i == 0) {
            return 0;
        }
    }
    return 1;
}

int replace_digits(int x, int y, int z) {
    int digits[10], i, j, result;
    div_t dm;

    dm.quot = x;
    for (i = 0; dm.quot > 0; i++) {
        dm = div(dm.quot, 10);
        if (dm.rem == y) {
            digits[i] = z;
        } else {
            digits[i] = dm.rem;
        }
    }
    result = 0;
    for (j = 0; j < i; j++) {
        result += pow(10, j) * digits[j];
    }
    return result;
}

int count_max_replaceable_digits(int x) {
    int count, max_count, i, j, replaced;

    max_count = 0;
    if (is_prime(x)) {
        for (i = 0; i < 10; i++) {
            count = 1;
            for (j = i; j < 10; j++) {
                replaced = replace_digits(x, i, j);
                if (replaced != x && is_prime(replaced)) {
                    count++;
                    if (max_count < count) {
                        max_count = count;
                    }
                }
            }
        }
    }
    return max_count;
}

int main(int argc, const char *argv[]) {
    int i;

    for (i = 0; count_max_replaceable_digits(i) < 8; i++);
    printf("%d\n", i);
    return 0;
}

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
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX(x, y) ((x) > (y) ? (x) : (y))

bool is_prime(int x) {
    if (x == 2) {
        return true;
    }
    if (x < 2 || x % 2 == 0) {
        return false;
    }
    int sqrt_x = (int)sqrt(x);
    for (int i = 3; i <= sqrt_x; i += 2) {
        if (x % i == 0) {
            return false;
        }
    }
    return true;
}

int replace_digits(int x, int y, int z) {
    int digits[10];
    int i;
    div_t dm = { .quot = x };
    for (i = 0; dm.quot > 0; i++) {
        dm = div(dm.quot, 10);
        if (dm.rem == y) {
            digits[i] = z;
        } else {
            digits[i] = dm.rem;
        }
    }
    int result = 0;
    for (int j = 0; j < i; j++) {
        result += pow(10, j) * digits[j];
    }
    return result;
}

int count_max_replaceable_digits(int x) {
    if (!is_prime(x)) {
        return 0;
    }
    int max_count = 0;
    for (int i = 0; i < 10; i++) {
        int count = 1;
        for (int j = i; j < 10; j++) {
            int replaced = replace_digits(x, i, j);
            if (replaced != x && is_prime(replaced)) {
                count++;
                max_count = MAX(max_count, count);
            }
        }
    }
    return max_count;
}

int main(void) {
    int i;
    for (i = 0; count_max_replaceable_digits(i) < 8; i++);
    printf("%d\n", i);
    return 0;
}

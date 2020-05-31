/*
 * It can be seen that the number, 125874, and its double, 251748, contain exactly
 * the same digits, but in a different order.
 *
 * Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
 * contain the same digits.
 */
#include <stdio.h>
#include <stdlib.h>

int digit_to_set(int x) {
    int bits;
    div_t dm;

    bits = 0;
    dm.quot = x;
    while (dm.quot) {
        dm = div(dm.quot, 10);
        bits |= 1 << dm.rem;
    }
    return bits;
}

int count_cycle(int x) {
    int t, set, i;

    t = x;
    set = digit_to_set(x);
    for (i = 0; i < 10; i++) {
        if (set != digit_to_set(x)) {
            break;
        }
        x += t;
    }
    return i;
}

int main(void) {
    int i;

    for (i = 1; count_cycle(i) < 6; i++);
    printf("%d\n", i);
    return 0;
}

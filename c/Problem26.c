/*
 * A unit fraction contains 1 in the numerator. The decimal representation of the
 * unit fractions with denominators 2 to 10 are given:
 *
 *     ^1/[2]  =  0.5
 *     ^1/[3]  =  0.(3)
 *     ^1/[4]  =  0.25
 *     ^1/[5]  =  0.2
 *     ^1/[6]  =  0.1(6)
 *     ^1/[7]  =  0.(142857)
 *     ^1/[8]  =  0.125
 *     ^1/[9]  =  0.(1)
 *     ^1/[10] =  0.1
 *
 * Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
 * seen that ^1/[7] has a 6-digit recurring cycle.
 *
 * Find the value of d < 1000 for which ^1/[d] contains the longest recurring
 * cycle in its decimal fraction part.
 */

#include <stdio.h>

int powmod(int x, int y, int z) {
    if (!y) {
        return 1;
    }
    int t = powmod(x, y >> 1, z);
    t = t * t % z;
    if (y & 1) {
        t = t * x % z;
    }
    return t;
}

int felm(int x) {
    if (x & 1) {
        for (int i = 1; i < x; i++) {
            if (powmod(10, i, x) == 1) {
                return i;
            }
        }
    }
    return 0;
}

int main(void) {
    int max_i = 0;
    int max_felm = 0;
    for (int i = 0; i < 1000; i++) {
        int x = felm(i);
        if (max_felm < x) {
            max_felm = x;
            max_i = i;
        }
    }
    printf("%d\n", max_i);
    return 0;
}

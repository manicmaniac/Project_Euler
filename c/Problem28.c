/*
 * Starting with the number 1 and moving to the right in a clockwise direction a 5
 * by 5 spiral is formed as follows:
 *
 * 21 22 23 24 25
 * 20  7  8  9 10
 * 19  6  1  2 11
 * 18  5  4  3 12
 * 17 16 15 14 13
 *
 * It can be verified that the sum of the numbers on the diagonals is 101.
 *
 * What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed
 * in the same way?
 */
#include <stdio.h>

/* N   E
 *  \ /
 *   *
 *  / \
 * W   S
 */

inline int north(int x) {
    int y;

    y = 2 * x + 1;
    return y * y - 2 * x;
}

inline int east(int x) {
    int y;

    y = 2 * x + 1;
    return y * y;
}

inline int south(int x) {
    int y;

    y = 2 * x + 1;
    return y * y - 6 * x;
}

inline int west(int x) {
    int y;

    y = 2 * x + 1;
    return y * y - 4 * x;
}

int main(int argc, char const* argv[]) {
    int i;
    int res;

    res = 1;
    for (i = 1; i <= 500; i++) {
        res += north(i);
        res += east(i);
        res += south(i);
        res += west(i);
    }
    printf("%d\n", res);
    return 0;
}

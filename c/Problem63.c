/*
 * The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
 * number, 134217728=8^9, is a ninth power.
 *
 * How many n-digit positive integers exist which are also an nth power?
 */

#include <math.h>
#include <stdio.h>

int main(void) {
    int count, a, b;

    count = 0;
    for (a = 1; a < 10; a++) {
        for (b = 1; b < 22; b++) {
            if ((int)(log10(a) * b + 1) == b) {
                count++;
            }
        }
    }
    printf("%d\n", count);
    return 0;
}

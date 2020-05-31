/*
 * If p is the perimeter of a right angle triangle with integral length sides, {a,
 * b,c}, there are exactly three solutions for p = 120.
 *
 * {20,48,52}, {24,45,51}, {30,40,50}
 *
 * For which value of p ≤ 1000, is the number of solutions maximised?
 */
#include <math.h>
#include <stdio.h>

int count_combinations_of_sides_for_perimeter(int p) {
    int count, i, j;
    double k, integral;

    count = 0;
    for (i = 1; i < p; i++) {
        for (j = i; j < (p - i); j++) {
            k = hypot(i, j);
            if (i + j + k == p && modf(k, &integral) == 0.0) {
                count++;
            }
        }
    }
    return count;
}

int main(void) {
    int p, p_for_max_count, max_count, count;

    p_for_max_count = 0;
    max_count = 0;
    for (p = 12; p < 1000; p += 12) {
        count = count_combinations_of_sides_for_perimeter(p);
        if (max_count < count) {
            max_count = count;
            p_for_max_count = p;
        }
    }
    printf("%d\n", p_for_max_count);
    return 0;
}

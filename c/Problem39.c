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
    int count = 0;
    for (int i = 1; i < p; i++) {
        for (int j = i; j < (p - i); j++) {
            double k = hypot(i, j);
            double integral;
            if (i + j + k == p && modf(k, &integral) == 0) {
                count++;
            }
        }
    }
    return count;
}

int main(void) {
    int p_for_max_count = 0;
    int max_count = 0;
    for (int p = 12; p < 1000; p += 12) {
        int count = count_combinations_of_sides_for_perimeter(p);
        if (max_count < count) {
            max_count = count;
            p_for_max_count = p;
        }
    }
    printf("%d\n", p_for_max_count);
    return 0;
}

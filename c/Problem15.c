/*
 * Starting in the top left corner of a 2×2 grid, there are 6 routes (without
 * backtracking) to the bottom right corner.
 * 
 * [p_015]
 * 
 * How many routes are there through a 20×20 grid?
 */
#include <stdio.h>

double c(int n, int r) {
    double res = 1;
    int i;
    for (i = r + 1; i < n + 1; i++) {
        res *= i;
    }
    for (i = 1; i < r + 1; i++) {
        res /= i;
    }
    return res;
}

int main(int argc, char const* argv[]) {
    printf("%.lf\n", c(40, 20));
    
    return 0;
}


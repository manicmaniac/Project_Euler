/*
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 * 
 * a^2 + b^2 = c^2
 * 
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 * 
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */
#include <stdio.h>
#include <math.h>

int main(int argc, char const* argv[])
{
    int m = 1;
    int n = 1;
    for (; m * (m + n) != 500; n++) {
        if (m < n) {
            m++;
            n = 1;
        }
    }
    printf("%.lf\n", (pow(m, 4) - pow(n, 4)) * 2 * m * n);
    return 0;
}


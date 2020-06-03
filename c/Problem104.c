/*
 * The Fibonacci sequence is defined by the recurrence relation:
 *
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 *
 * It turns out that F[541], which contains 113 digits, is the first Fibonacci
 * number for which the last nine digits are 1-9 pandigital (contain all the
 * digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
 * digits, is the first Fibonacci number for which the first nine digits are 1-9
 * pandigital.
 *
 * Given that F[k] is the first Fibonacci number for which the first nine digits
 * AND the last nine digits are 1-9 pandigital, find k.
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

/*
 * estimate first digits of the `n` term of fibonacci sequence
 */
long upper_fib(int n, int precision) {
    static const double log10_phi = 0.20898764024997873;
    static const double log10_sqrt5 = 0.34948500216800940;
    double log10_fib = (n + 1) * log10_phi - log10_sqrt5;
    if (log10_fib > precision) {
        double integral;
        double fractional = modf(log10_fib, &integral);
        log10_fib = precision + fractional;
    }
    return (long)round(pow(10, log10_fib - 1));
}

typedef bool lower_fibs_callback(int n, long fib, int precision);

/*
 * iterate last digits of fibonacci sequence
 */
void lower_fibs(int precision, lower_fibs_callback callback) {
    long a = 0, b = 1;
    bool next = true;
    long divisor = (long)pow(10, precision);
    for (int n = 0; next; n++) {
        long c = a;
        a = b;
        b = (b + c) % divisor;
        next = callback(n, a, precision);
    }
}

/*
 * check if the given number is pandigital
 */
bool is_pandigital(long x) {
    if (x % 9) {
        /* all pandigital numbers are divisible by 9 */
        return false;
    }
    unsigned int flags = 0x1;
    ldiv_t dm = { .quot = x };
    while (dm.quot) {
        dm = ldiv(dm.quot, 10);
        flags |= 0x1 << dm.rem;
    }
    return flags == 0x3ff;
}

static lower_fibs_callback callback;

int main(void) {
    lower_fibs(9, callback);
    return 0;
}

static bool callback(int n, long fib, int precision) {
    if (is_pandigital(fib) && is_pandigital(upper_fib(n, precision))) {
        printf("%d\n", n + 1);
        return false;
    }
    return true;
}

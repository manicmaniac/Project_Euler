/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

typedef void (*lfactorize_callback_t)(long factor, void *context);

void lfactorize(long x, lfactorize_callback_t callback, void *context) {
    long divisor = 2;
    ldiv_t dm;

    while (x >= divisor) {
        dm = ldiv(x, divisor);
        if (dm.rem) {
            divisor++;
        } else {
            callback(divisor, context);
            x = dm.quot;
        }
    }
}

static void lfactorize_callback(long factor, void *context) {
    long *max_factor;

    if (context) {
        max_factor = (long *)context;
        *max_factor = factor;
    }
}

int main(int argc, const char *argv[]) {
    long max_factor;

    lfactorize(600851475143, lfactorize_callback, (void *)&max_factor);
    printf("%ld\n", max_factor);
    return 0;
}

/*
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 * 
 * For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 * and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
 * 
 * Find the sum of the digits in the number 100!
 */
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

int main(int argc, char const* argv[]) {
    mpz_t rop;
    mpz_init(rop);
    mpz_fac_ui(rop, 100);
    size_t size = mpz_sizeinbase(rop, 10);
    char *buffer = (char *)calloc(size + 1, sizeof(char));
    gmp_snprintf(buffer, size, "%Zd", rop);
    mpz_clear(rop);
    int sum = 0;
    int i;
    char c;
    for (i = 0; (c = buffer[i]) != '\0'; i++) {
        sum += c - '0';
    }
    free(buffer);
    printf("%d\n", sum);
    return 0;
}


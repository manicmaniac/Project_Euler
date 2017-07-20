/*
 * 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 *
 * What is the sum of the digits of the number 2^1000?
 */
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

int main(int argc, char *argv[]) {
    mpz_t rop;
    mpz_init(rop);
    mpz_ui_pow_ui(rop, 2, 1000);
    size_t size = mpz_sizeinbase(rop, 10) + 1;
    char *buffer = malloc((size + 1) * sizeof(char));
    gmp_snprintf(buffer, size, "%Zd", rop);
    mpz_clear(rop);
    int res = 0;
    size_t i;
    for (i = 0; buffer[i] != '\0'; i++) {
        res += buffer[i] - '0';
    }
    free(buffer);
    printf("%d\n", res);
    return 0;
}

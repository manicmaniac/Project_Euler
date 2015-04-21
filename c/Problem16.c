/*
 * 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 * 
 * What is the sum of the digits of the number 2^1000?
 */
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

int main(int argc, char const* argv[]) {
    mpz_t rop;
    mpz_ui_pow_ui(rop, 2, 1000);
    char *buffer = (char *)calloc(10000 + 1, sizeof(char));
    gmp_snprintf(buffer, 10000, "%Zd", rop);
    int res = 0;
    int i;
    for (i = 0; buffer[i] != '\0'; i++) {
        res += buffer[i] - '0';
    }
    printf("%d\n", res);
    free(buffer);
    return 0;
}


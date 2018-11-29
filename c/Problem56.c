/*
 * A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^
 * 100 is almost unimaginably large: one followed by two-hundred zeros. Despite
 * their size, the sum of the digits in each number is only 1.
 *
 * Considering natural numbers of the form, a^b, where a, b < 100, what is the
 * maximum digital sum?
 */
#include <stdio.h>
#include <gmp.h>

#define DIGITS_COUNT_OF_99_99 198 /* log10(99) * 99 + 1 */

int main(int argc, const char *argv[]) {
    int a, b, written, i, max_sum, sum;
    mpz_t rop;
    char buffer[DIGITS_COUNT_OF_99_99 + 1];

    max_sum = 0;
    mpz_init(rop);
    for (a = 2; a < 100; a++) {
        for (b = 2; b < 100; b++) {
            mpz_ui_pow_ui(rop, a, b);
            written = gmp_snprintf(buffer, DIGITS_COUNT_OF_99_99 + 1, "%Zd", rop);
            if (written < 0) {
                goto fail;
            }
            sum = 0;
            for (i = 0; i < written; i++) {
                sum += buffer[i] - '0';
            }
            if (max_sum < sum) {
                max_sum = sum;
            }
        }
    }
    mpz_clear(rop);
    printf("%d\n", max_sum);
    return 0;

fail:
    mpz_clear(rop);
    return 1;
}

/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143 ?
 */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct {
    int number;
    int count;
} factor_t;

factor_t *factorize(long n, size_t *size) {
    factor_t *res = (factor_t *)calloc(1, sizeof(factor_t));
    while (n % 2 == 0) {
        res[0].count++;
        n /= 2;
    }
    int d = 3;
    *size = 0;
    while (n >= d) {
        if (n % d) {
            d += 2;
        } else {
            *size += 1;
            res = (factor_t *)realloc(res, *size * sizeof(factor_t));
            res[*size].number = d;
            res[*size].count++;
            n /= d;
        }
    }
    return res;
}

int main(int argc, char const* argv[])
{
    const int long n = 600851475143;
	size_t size;
    factor_t *factors = factorize(n, &size);
    //printf("%d\n", factors[size - 1]);
    int i;
    for (i = 0; i < size; i++) {
        printf("%d\n", factors[i].number);
    }
	free(factors);
	return 0;
}


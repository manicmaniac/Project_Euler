#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int *sieve(int limit, size_t *size) {
    if (limit < 2) {
        return NULL;
    }
    char *search = (char *)calloc(limit, sizeof(char));
    const char UNKNOWN = 0;
    const char NONPRIME = 1;
    search[0] = NONPRIME;
    search[1] = NONPRIME;
    int current;
    int i;
    double sqrt_limit = sqrt(limit);
    for (current = 2; current <= sqrt_limit; current++) {
	for (i = current << 1; i < limit; i += current) {
	    search[i] = NONPRIME;
	}
    }
    *size = 0;
    int *sparse_res = (int *)malloc(limit * sizeof(int));
    for (i = 0; i < limit; i++) {
	if (search[i] == UNKNOWN) {
	    sparse_res[*size] = i;
	    *size += 1;
	}
    }
    free(search);
    int *res = (int *)malloc(*size * sizeof(int));
    memcpy(res, sparse_res, *size * sizeof(int));
    free(sparse_res);
    return res;
}

int main(int argc, char const* argv[])
{
    const int limit = 2000000;
    size_t size;
    int *sieved = sieve(limit, &size);
    int i;
    long res = 0;
    for (i = 0; i < size; i++) {
        res += sieved[i];
    }
    free(sieved);
    printf("%ld\n", res);
    return 0;
}


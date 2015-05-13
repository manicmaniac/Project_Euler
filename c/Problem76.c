/*
 * It is possible to write five as a sum in exactly six different ways:
 * 
 * 4 + 1
 * 3 + 2
 * 3 + 1 + 1
 * 2 + 2 + 1
 * 2 + 1 + 1 + 1
 * 1 + 1 + 1 + 1 + 1
 * 
 * How many different ways can one hundred be written as a sum of at least two
 * positive integers?
 */
#include <stdio.h>
#include <stdlib.h>

int npartitions(int n) {
    int i, j;
    int *cache;
    cache = (int *)calloc(n + 1, sizeof(int));
    cache[0] = 1;
    for (i = 1; i <= n; i++) {
        for (j = i; j <= n; j++) {
            cache[j] += cache[j - i];
        }
    }
    return cache[n];
}

int main(int argc, char const* argv[]) {
    printf("%d\n", npartitions(100));
    return 0;
}


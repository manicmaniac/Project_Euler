/*
 * The following iterative sequence is defined for the set of positive integers:
 *
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following sequence:
 *
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 *
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains
 * 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
 * that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 */
#include <stdio.h>
#include <stdlib.h>

int longest_collatz(int limit) {
    int *cache, longest_start = 0, longest_length = 0, start, length;
    long i;

    cache = calloc(limit, sizeof(int));
    for (start = 1; start < limit; start += 2) {
        length = 1;
        for (i = start; i > 1; length++) {
            i = (i % 2 ? 3 * i + 1 : i / 2);
            if (i <= limit && cache[i]) {
                length += cache[i];
                break;
            }
        }
        if (longest_length < length) {
            longest_start = start;
            longest_length = length;
        }
        cache[start] = length;
    }
    free(cache);
    return longest_start;
}

int main(int argc, const char *argv[]) {
    printf("%d\n", longest_collatz(1000000));
    return 0;
}

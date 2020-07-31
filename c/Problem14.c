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

int longest_collatz(int limit, int *cache) {
    int longest_start = 0, longest_length = 0;

    for (int start = limit / 2 + 1; start < limit; start++) {
        int length = 1;
        for (long i = start; i > 1; length++) {
            i = (i & 1 ? (i << 1) + i + 1 : i >> 1);
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
    return longest_start;
}

int main(void) {
#define N 1000000
    int cache[N] = { 0 };
    printf("%d\n", longest_collatz(N, cache));
    return 0;
}

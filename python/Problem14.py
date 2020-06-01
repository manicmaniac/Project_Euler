# coding:utf-8
"""
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
"""

def max_cached_collatz(n):
    cache = {}
    longest = (0, 0)
    for start in range(1, n, 2):
        length = 1
        i = start
        while i > 1:
            if i & 1:
                i = 3 * i + 1
            else:
                i >>= 1
            if cache.has_key(i):
                length += cache[i]
                break
            length += 1
        if longest[1] < length:
            longest = (start, length)
        cache[start] = length
    return longest

print(max_cached_collatz(1000000)[0])

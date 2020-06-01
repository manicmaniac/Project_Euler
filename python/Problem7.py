# coding:utf-8
r"""
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
"""

import math
import itertools
import sys


def prime_numbers(x):
    return x / math.log(x)


def sieve(limit):
    if sys.version_info < (3,):
        range = xrange
    search = bytearray([1] * limit)
    search[0] = 0
    search[1] = 0
    sqrt_limit = int(math.sqrt(limit))
    for i in range(2, sqrt_limit):
        if search[i]:
            for j in range(i << 1, limit, i):
                search[j] = 0
    return itertools.compress(range(limit), search)


if __name__ == '__main__':
    for i in itertools.count(2):
        if prime_numbers(i) > 10001:
            print(next(itertools.islice(sieve(i), 10000, 10001)))
            break

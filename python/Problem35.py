# coding:utf-8
"""
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
"""

import collections
import bisect
import itertools
import math


def sieve(limit):
    search = bytearray([1] * limit)
    search[0] = 0
    search[1] = 0
    sqrt_limit = int(limit ** 0.5)
    for i in range(2, sqrt_limit):
        if search[i]:
            for j in range(i << 1, limit, i):
                search[j] = 0
    return itertools.compress(range(limit), search)


def contains(a, x):
    i = bisect.bisect_left(a, x)
    return i != len(a) and a[i] == x


def is_in_primes(primes):
    def inner(x):
        return contains(primes, x)
    return inner


def is_circular_prime(x, is_prime):
    for i in cycle(x):
        if not is_prime(i):
            return False
    return True


def cycle(x):
    ndigits = int(math.log10(x))
    for _ in range(ndigits + 1):
        yield x
        x = (x % 10) * 10 ** ndigits + x // 10


if __name__ == '__main__':
    primes = list(sieve(1000000))
    is_prime = is_in_primes(primes)
    print(len([i for i in primes if is_circular_prime(i, is_prime)]))

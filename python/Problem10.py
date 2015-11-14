#!/usr/bin/env python
# -*- coding:utf-8 -*-
r"""
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"""

import itertools
import math
import sys


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
    print(sum(sieve(2000000)))

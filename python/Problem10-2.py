#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
'''

# from sympy import sieve
# 
# print sum(sieve.primerange(1, int(2e6)))

from math import sqrt
from array import array
from itertools import repeat, count, compress

def sieve(limit):
    if limit < 2:
        raise Error('limit must be greater than 1')
    UNKNOWN, NONPRIME = 1, 0
    search = array('b', repeat(UNKNOWN, limit))
    search[0] = NONPRIME
    search[1] = NONPRIME
    sqrt_limit = sqrt(limit)
    for current in count(2):
        for i in xrange(current * 2, limit, current):
            search[i] = NONPRIME
        if sqrt_limit < current:
            break
    return compress(xrange(limit), search)

if __name__ == '__main__':
    print sum(sieve(2000000))


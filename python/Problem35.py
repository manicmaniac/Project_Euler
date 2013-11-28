#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
'''

from sympy import isprime, sieve

def gencircular(n):
    digits = list(str(n))
    for i in digits:
        yield int(''.join(digits))
        digits.append(digits.pop(0))

class Memoise:
    def __init__(self, func):
        self.func = func
        self.cache = {}

    def __call__(self, *args):
        if self.cache.has_key(args):
            return self.cache[args]
        res = self.func(*args)
        self.cache[args] = res
        return res

isprime = Memoise(isprime)

if __name__ == '__main__':
    print len([i for i in sieve.primerange(1, 10**6) if all(map(isprime, gencircular(i)))])


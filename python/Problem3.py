#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
'''
import math
import fractions


def trial_division(n):
    '''
    find the smallest divisor of the integer `n` with Trial Division method.
    returns -1 if it is a prime.
    '''
    limit = int(math.sqrt(n) + 1)
    for i in range(2, limit):
        if not n % i:
            return i
    return -1


def pollards_rho(n):
    '''
    find the one of divisors of the integer `n` with Pollard's Rho method.
    returns -1 if it is a prime.
    '''
    if n < 10:
        # switch to trial division for a small integer
        return trial_division(n)
    x, y, c, d = 2, 2, 1, 1
    def f(x):
        # the LCG pseudorandom number generator
        return (x * x + c) % n
    while d == 1 and n:
        x = f(x)
        y = f(f(y))
        d = fractions.gcd(x - y, n)
        if d == n:
            return -1
    return d


class memoize(object):
    '''
    a decorator function class for memoizing a expensive function
    '''
    def __init__(self, func):
        self._func = func
        self._cache = {}

    def __call__(self, *args):
        if self._cache.has_key(args):
            return self._cache[args]
        res = self._func(*args)
        self._cache[args] = res
        return res


@memoize
def factor(n):
    '''
    factorize the integer `n`.
    returns list of prime factors.
    '''
    divisor = pollards_rho(n)
    if divisor == -1:
        return [n]
    return factor(n / divisor) + factor(divisor)


if __name__ == '__main__':
    print max(factor(600851475143))


#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Euler published the remarkable quadratic formula:

nÂ² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41Â² + 41 + 41 is clearly divisible by 41.

Using computers, the incredible formula  nÂ²  79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.

Considering quadratics of the form:

nÂ² + an + b, where |a|  1000 and |b|  1000

where |n| is the modulus/absolute value of n
e.g. |11| = 11 and |4| = 4
Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
'''

from sympy import *

class Formula(object):
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def formula(self, n=Symbol('n')):
        return n * (n + self.a) + self.b

    def __repr__(self):
        return str(expand(self.formula()))

    @property
    def length(self):
        n = 0
        while isprime(self.formula(n)):
            n += 1
        return n


if __name__ == '__main__':
    max_length = 0
    for a in range(-999, 999, 2):
        for b in sieve.primerange(2, 999):
            formula = Formula(a, b)
            if max_length < formula.length:
                max_length = formula.length
                ans = a * b
    print ans


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

from prime import *
import time

start = time.time()

def genodd(max):
    return [i for i in range(-max + 1, max) if i % 2]

def formula(n, a, b):
    return n * (n + a) + b

def test(m):
    acc = []
    for a in [i for i in genodd(m)]:
        for b in genprime(m):
            length = 0
            for n in range(m):
                if n * (n + a) % 2: break
                if isprime(formula(n, a, b)):
                    length += 1
                else: break
            yield length, a, b


if __name__ == '__main__':
    res = max(test(1000))
    print res[1] * res[2]
    print time.time() - start

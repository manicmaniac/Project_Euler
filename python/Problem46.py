#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 212
15 = 7 + 222
21 = 3 + 232
25 = 7 + 232
27 = 19 + 222
33 = 31 + 212

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
'''

from sympy import isprime, sieve
from itertools import count

def double_squares(limit):
    for i in count():
        res = 2 * i ** 2
        if res > limit:
            break
        yield res

def is_goldbach_composite(n):
    if isprime(n):
        return True
    for prime in sieve.primerange(1, n):
        for ds in double_squares(n):
            if prime + ds == n:
                return True
    return False

if __name__ == '__main__':
    for i in count(5, 2):
        if not is_goldbach_composite(i):
            print i
            break


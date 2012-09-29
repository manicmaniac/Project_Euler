#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The number 3797 has an interesting property. Being prime itself, it is possible
to continuously remove digits from left to right, and remain prime at each
stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797,
379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to
right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
'''

from sympy import *

def trunc_l2r(n):
    s = str(n)
    l = len(s)
    for i in range(l):
        yield int(s[i:])


def trunc_r2l(n):
    s = str(n)
    l = len(s)
    for i in range(l):
        yield int(s[:l - i])


if __name__ == '__main__':
    primes = iter(sieve)
    found = 0
    ans = 0
    while found < 11:
        prime = primes.next()
        if prime < 9:
            continue
        if all(isprime(x) for x in list(trunc_l2r(prime)) + list(trunc_r2l(prime))):
            found += 1
            ans += prime
    print ans


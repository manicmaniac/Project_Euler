#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
'''

from prime import genprime, isprime

def remove_ltor(n):
    s = str(n)
    l = len(s)
    for i in range(l):
        yield int(s[i:])

def remove_rtol(n):
    s = str(n)
    l = len(s)
    for i in range(l):
        yield int(s[:l - i])

if __name__ == '__main__':
    acc = 0
    c = 0
    for i in genprime():
        if i < 9: continue
        if all(isprime(s) for s in remove_ltor(i)) and all(isprime(t) for t in remove_rtol(i)):
            acc += i
            c += 1
            if c >= 11: break
    print acc


#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
'''
from sympy import sieve, isprime

def genseq():
    for i in sieve.primerange(1000, 3333):
        for j in range(1000, 3333, 2):
            if isprime(i + j) and isprime(i + j * 2):
                yield [i, i + j, i + j * 2]

def is_permutation(l):
    return len(set(''.join(sorted(str(i))) for i in l)) == 1

if __name__ == '__main__':
    print ''.join(map(str, filter(is_permutation, genseq())[1]))


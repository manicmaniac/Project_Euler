#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this sequence?
'''
from prime import genprime, isprime
from operator import add

def genseq():
    for i in genprime(3333):
        if i > 1000:
            for j in range(2, 3333, 2):
                if isprime(i + j) and isprime(i + j * 2):
                    seq = [i, i + j, i + j * 2]
                    yield seq

def is_permutation(l):
    return sorted(list(str(l[0]))) == sorted(list(str(l[1]))) == sorted(list(str(l[2])))

def concatenate(n):
    return reduce(add, [str(i) for i in n])

if __name__ == '__main__':
    for i in genseq():
        if is_permutation(i): print concatenate(i)


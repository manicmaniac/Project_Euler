#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
'''

from prime import isprime
from itertools import permutations

def gen_pandigital(d):
    for i in permutations(range(1,d + 1)):
        l = map(str, list(i[:]))
        yield int(''.join(l))

if __name__ == '__main__':
    for i in range(1, 10):
        for j in gen_pandigital(i):
            if isprime(j): res = j
    print res

#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The first two consecutive numbers to have two distinct prime factors are:

14 = 2  7
15 = 3  5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2Â²  7  23
645 = 3  5  43
646 = 2  17  19.

Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?
'''

from sympy import *

def find(n):
    i = 1
    while True:
        if all(map(lambda x: len(factorint(x)) == n, range(i, i+n))):
            return i
        i += 1

if __name__ == '__main__':
    print find(4)


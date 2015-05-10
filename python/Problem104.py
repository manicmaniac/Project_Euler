#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The Fibonacci sequence is defined by the recurrence relation:

    F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.

It turns out that F[541], which contains 113 digits, is the first Fibonacci
number for which the last nine digits are 1-9 pandigital (contain all the
digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
digits, is the first Fibonacci number for which the first nine digits are 1-9
pandigital.

Given that F[k] is the first Fibonacci number for which the first nine digits
AND the last nine digits are 1-9 pandigital, find k.
'''

import math


# constants
LOG_PHI = math.log10((1 + math.sqrt(5)) / 2)
LOG_SQRT5 = math.log10(5) / 2

def upper_fib(n):
    ''' terms of first 9 digits of fibonacci sequence '''
    l = LOG_PHI * (n + 1) - LOG_SQRT5
    if l > 9:
        # take first 10 digits for precision
        l, _ = math.modf(l)
        l += 9
    # and drop last digits
    return int(10 ** l + 0.5) / 10


def lower_fibs():
    ''' terms of last 9 digits of fibonacci sequence '''
    i, j = 0, 1
    while True:
        # take last 9 digits
        i, j = j, (i + j) % 1000000000
        yield i
    

def is_pandigital(n):
    ''' check if pandigital from 1 to 9 '''
    if n % 9:
        return False
    bits = 0
    while n:
        n, d = divmod(n, 10)
        bits |= 1 << d
    return bits == 0x3fe


if __name__ == '__main__':
    for i, fib in enumerate(lower_fibs()):
        if is_pandigital(fib) and is_pandigital(upper_fib(i)):
            break
    print i + 1


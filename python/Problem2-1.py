#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
'''

from math import sqrt
from itertools import count, takewhile, imap

SQRT_5 = sqrt(5)
PHI = (1 + SQRT_5) / 2

def fibterm(n):
    return int((PHI ** n / SQRT_5) + 0.5)

def less_than(limit):
    def inner(x):
        return x < limit
    return inner


if __name__ == '__main__':
    print sum(takewhile(less_than(4e6), imap(fibterm, count(3, 3))))


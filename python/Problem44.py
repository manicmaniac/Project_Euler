#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Pentagonal numbers are generated by the formula, Pn=n(3n1)/2. The first ten pentagonal numbers are:

1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70  22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference is pentagonal and D = |Pk  Pj| is minimised; what is the value of D?
'''

import collections
import itertools
import math


def pentagonal(n):
    return n * (3 * n - 1) / 2


def is_pentagonal(n):
    return ((math.sqrt(24 * n + 1) + 1) / 6).is_integer()


if __name__ == '__main__':
    cache = collections.deque()
    try:
        for i in itertools.imap(pentagonal, itertools.count(1)):
            for j in cache:
                if is_pentagonal(i - j) and is_pentagonal(i + j):
                    raise StopIteration
            cache.appendleft(i)
    except StopIteration:
        print(i - j)

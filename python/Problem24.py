#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
'''

import itertools

def nth(iterable, n, default=None):
    return next(itertools.islice(iterable, n, None), default)

if __name__ == '__main__':
    perms = itertools.permutations(range(10))
    print ''.join(map(str, nth(perms, 999999)))


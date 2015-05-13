#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
It is possible to write five as a sum in exactly six different ways:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two
positive integers?
'''

from itertools import repeat

def npartitions(n):
    cache = [1] + list(repeat(0, n))
    for i in range(1, n + 1):
        for j in range(i, n + 1):
            cache[j] += cache[j - i]
    return cache[n]

if __name__ == '__main__':
    print npartitions(100)


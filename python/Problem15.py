#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Starting in the top left corner of a 2×2 grid, there are 6 routes (without
backtracking) to the bottom right corner.

[p_015]

How many routes are there through a 20×20 grid?
'''

from operator import mul
from math import factorial

def c(a, b):
    return reduce(mul, range(b + 1, a + 1)) / factorial(b)

if __name__ == '__main__':
    print c(40, 20)


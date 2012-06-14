#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
tarting in the top left corner of a 2×2 grid, there are 6 routes (without backtracking) to the bottom right corner.
How many routes are there through a 20×20 grid?
'''

def factorial(x):
    return reduce(lambda x, y: x * y, [i for i in range(1, x + 1)])

def c(s, t):
    return factorial(s) / (factorial(t) * factorial(s - t))

def calcroute(height, width):
    return c(height + width, height)

print calcroute(20, 20)

# coding:utf-8
"""
The cube, 41063625 (345^3), can be permuted to produce two other cubes:
56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube
which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are
cube.
"""

from itertools import count

def cube(n):
    return n * n * n

def sort_digits(n):
    return ''.join(sorted(str(n)))

def min_key(value, d):
    return min(k for k, v in d.iteritems() if v == value)

cache = {}
for i in count():
    i = cube(i)
    current = sort_digits(i)
    cache[i] = current
    if cache.values().count(current) == 5:
        print(min_key(current, cache))
        break


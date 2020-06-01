# coding:utf-8
"""
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
"""

from functools import reduce
try:
    from math import gcd
except ImportError:
    from fractions import gcd


def lcm(x, y):
    return x * y // gcd(x, y)

if __name__ == '__main__':
    print(reduce(lcm, range(1, 21)))

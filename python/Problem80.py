#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
It is well known that if the square root of a natural number is not an integer,
then it is irrational. The decimal expansion of such square roots is infinite
without any repeating pattern at all.

The square root of two is 1.41421356237309504880..., and the digital sum of the
first one hundred decimal digits is 475.

For the first one hundred natural numbers, find the total of the digital sums
of the first one hundred decimal digits for all the irrational square roots.
'''

from decimal import *

getcontext().prec = 105
squares = [i ** 2 for i in range(10)]


def sum_digits(n):
    return sum(map(int, str(n)))


def floor(n):
    return int(n - (n % 1))


if __name__ == '__main__':
    res = 0
    for i in range(100):
        if i not in squares:
            res += sum_digits(floor(Decimal(i).sqrt() * 10 ** 99))
    print res

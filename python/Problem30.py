#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14 + 64 + 34 + 44
8208 = 84 + 24 + 04 + 84
9474 = 94 + 44 + 74 + 44
As 1 = 14 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
'''


class is_armstrong(object):
    def __init__(self, n):
        self._pows = [i ** n for i in range(10)]

    def __call__(self, x):
        d = x
        acc = 0
        while d and acc <= x:
            d, m = divmod(d, 10)
            acc += self._pows[m]
        return acc == x


if __name__ == '__main__':
    print sum(filter(is_armstrong(5), range(2, 9 ** 5 * 6)))


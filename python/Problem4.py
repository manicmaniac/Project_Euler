#!/usr/bin/env python
# -*- coding:utf-8 -*-
r"""
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
Find the largest palindrome made from the product of two 3-digit numbers.
"""

import math


def is_palindrome(x):
    s = str(x)
    return s == s[::-1]


def is_3digits_product(x):
    for i in range(100, int(math.sqrt(x))):
        d, m = divmod(x, i)
        if not m and d < 1000:
            return True
    return False


if __name__ == '__main__':
    for i in reversed(xrange(10000, 998001)):
        if is_palindrome(i) and is_3digits_product(i):
            print(i)
            break

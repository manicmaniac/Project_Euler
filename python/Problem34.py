#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
'''

from math import factorial

def is_curious(n):
    return False if n < 3 else n == sum(factorial(int(i)) for i in str(n))

if __name__ == '__main__':
    print sum(filter(is_curious, range(factorial(9) * 7)))


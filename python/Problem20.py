#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
n! means n $B!_(B (n $B!](B 1) $B!_(B ... $B!_(B 3 $B!_(B 2 $B!_(B 1

For example, 10! = 10 $B!_(B 9 $B!_(B ... $B!_(B 3 $B!_(B 2 $B!_(B 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
'''

from math import factorial

print(sum(map(int, str(factorial(100)))))


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

i = 1000
res = []
acc = 0
while i < 354294:
    lst = map(int, str(i))
    if sum(map(lambda x: x ** 5, lst)) == i:
        acc += i
    i += 1
print acc

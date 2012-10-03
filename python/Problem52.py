#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
It can be seen that the number, 125874, and its double, 251748, contain exactly
the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
contain the same digits.
'''

def digits(n):
    return sorted(map(int, str(n)))

def has_same_digits(n):
    res = digits(n) == digits(n*2) == digits(n*3) == digits(n*4) == digits(n*5) == digits(n*6)
    return res

if __name__ == '__main__':
    res = 1
    while not has_same_digits(res):
        res += 1
    print res


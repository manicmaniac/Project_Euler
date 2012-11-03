#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
Find the largest palindrome made from the product of two 3-digit numbers.
'''

from math import sqrt

def is_palindromic(num):
    return str(num) == str(num)[::-1]

def is_3digits_product(n):
    for i in range(100, int(sqrt(n) + 1)):
        if not n % i and n / i < 1000:
            return True
    return False

if __name__ == '__main__':
    for i in reversed(range(10000, 998001)):
        if is_palindromic(i) and is_3digits_product(i):
            print i
            break


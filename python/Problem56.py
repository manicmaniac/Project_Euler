#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
A googol (10100) is a massive number: one followed by one-hundred zeros; 100100 is almost unimaginably large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, ab, where a, b < 100, what is the maximum digital sum?
'''
def find_max(m):
    res = 0
    for i in range(1, m):
        for j in range(1, m):
            tmp = sum(int(k) for k in str(i ** j))
            if tmp > res: res = tmp
    return res

if __name__ == '__main__':
    print find_max(100)


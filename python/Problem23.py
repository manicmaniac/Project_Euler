#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
'''

import math

def isAbundant(num):
    res = [1]
    for i in range(2, int(math.sqrt(num)) + 1):
        if not num % i:
            res.append(i)
            res.append(num / i)
    return sum(set(res)) > num

if __name__ == '__main__':
    abundants = list(set(map(lambda x: x * isAbundant(x), [i for i in range(1, 28124)])))[1:]
    twoabundants = []
    for i in abundants:
        for j in abundants:
            if j > i: break
            if i + j > 28123: break
            twoabundants.append(i + j)
    print sum(set(twoabundants) ^ set(range(1, 28124)))
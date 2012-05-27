#!/usr/bin/env python
# -*- coding:utf-8 -*-

#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

def SumMultiple(num):
    result = set([])
    for i in range(1, num):
        if i % 3 == 0:
            result.add(i)
        if i % 5 == 0:
            result.add(i)
    return sum(result)

if __name__ == '__main__':
    print(SumMultiple(1000))

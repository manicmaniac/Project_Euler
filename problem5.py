#!/usr/bin/env python
# -*- coding:utf-8 -*-

#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def FindDevisibleNumber(num):
    res = [1]
    ans = 1
    for i in range(1, num + 1):
        for j in res:
            if not i % j:
                k = i / j
        res.append(k)
    for i in res:
        ans *= i
    return res

if __name__ == '__main__':
    print (FindDevisibleNumber(10))

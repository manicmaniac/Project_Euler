#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
'''
import math

def showdevisor(num):
    res = [1]
    for i in range(2, int(math.sqrt(num)) + 1):
        if not num % i:
            res.append(i)
            res.append(num / i)
    return sorted(res)

def hasAmicable(num):
    i = sum(showdevisor(num))
    if (i != num) and(sum(showdevisor(i)) == num): return True
    return False

if __name__ == '__main__':
    ans = 0
    for i in range(2, 10000):
        if hasAmicable(i):
            ans += i
    print ans

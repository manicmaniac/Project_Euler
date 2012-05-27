#!/usr/bin/env python
# -*- coding:utf-8 -*-

#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def IsDevisibleNumber(num, dnum):
    c = 1
    for i in range(2, dnum + 1):
        if num % i == 0:
            c += 1
        if c == dnum:
            return True
    return False

def FindDevisibleNumber(num):
    i = num
    while True:
        if IsDevisibleNumber(i, num):
            return i
        else:
            i += 1

#def FindFactor(num):
#    res = []
#    for i in range(2, num / 2):
#        if num % i == 0:
#            res.append(i)
#    return res
#
#def FindDevisibleNumber(num):
#    s = range(2, num + 1)
#    for i in range(num - 1):
#        for j in range(num - 1):
#            if s[i] % s[j] == 0:
#                print s[j]

if __name__ == '__main__':
    print (FindDevisibleNumber(10))

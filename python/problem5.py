#!/usr/bin/env python
# -*- coding:utf-8 -*-

#2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def FindDevisibleNumber(num):
    import prime
    print(prime.factorize(num))

if __name__ == '__main__':
    import prime
    res = []
    ans = 1
    for i in range(2, 11):
        lst = prime.factorize(i)
        for j in range(len(lst)):
            ans *= lst[j]
        print(lst)
    print ans

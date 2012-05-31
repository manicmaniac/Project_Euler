#!/usr/bin/env python
# -*- coding:utf-8 -*-

#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

def FindLargestPrimeFactor(num):
    i = 2
    res = 1
    while True:
        if not num % i:
            yield i, num / i
            num /= i
        if i > 60085: break
        i += 1

if __name__ == '__main__':
    print(FindLargestPrimeFactor(600851475143))
    for i in FindLargestPrimeFactor(600851475143):
        print i

#!/usr/bin/env python
# -*- coding:utf-8 -*-

#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

def FindLargestPrimeFactor(num):
    i = 2
    while True:
        if num % i == 0:
            return num / i
        i += 1
    return 'Error'

if __name__ == '__main__':
    print(FindLargestPrimeFactor(600851475143))

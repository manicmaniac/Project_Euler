#/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
'''
from math import sqrt
from operator import add, mul

def gencircular(num):
    digits = list(str(num))
    for i in range(len(digits)):
        yield int(reduce(add, digits))
        digits.append(digits.pop(0))

def isprime(num):
    if num == 2: return True
    if not num % 2 or num < 2: return False
    for i in range(3, int(sqrt(num) + 1), 2):
        if not num % i: return False
    return True


if __name__ == '__main__':
    acc = 0
    for i in range(1, 1000000):
        if isprime(i):
            if reduce(mul, (isprime(j) for j in gencircular(i))):
                acc += 1
    print acc


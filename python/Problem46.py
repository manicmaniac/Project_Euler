#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 212
15 = 7 + 222
21 = 3 + 232
25 = 7 + 232
27 = 19 + 222
33 = 31 + 212

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
'''
from prime import genprime, isprime
from itertools import count

def gen_square(max):
    res = i = 0
    while res <= max:
        i += 1
        res = 2 * i ** 2
        yield res


def is_composite_of_prime_and_square(n):
    if isprime(n): return True
    for i in genprime(n):
        for j in gen_square(n):
            if i + j == n:
                return True
    return False


if __name__ == '__main__':
    for i in count(5, 2):
        if not is_composite_of_prime_and_square(i):
            print i
            break


#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
'''

candidates =  [int(''.join(map(str, [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10])))
        for d1 in range(1, 10)
        for d2 in range(10)
        for d3 in range(10)
        for d4 in range(10) if not (d2 * 100 + d3 * 10 + d4) % 2
        for d5 in range(10) if not (d3 * 100 + d4 * 10 + d5) % 3
        for d6 in range(10) if not (d4 * 100 + d5 * 10 + d6) % 5
        for d7 in range(10) if not (d5 * 100 + d6 * 10 + d7) % 7
        for d8 in range(10) if not (d6 * 100 + d7 * 10 + d8) % 11
        for d9 in range(10) if not (d7 * 100 + d8 * 10 + d9) % 13
        for d10 in range(10) if not (d8 * 100 + d9 * 10 + d10) % 17]

def is_pandigital(n):
    return sorted(str(n)) == map(str, range(10))


if __name__ == '__main__':
    print sum(filter(is_pandigital, candidates))


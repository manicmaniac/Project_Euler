#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
'''

from itertools import count, islice, chain

# N   E
#  \ /
#   *
#  / \
# W   S

def north():
    for n in count():
        yield (2 * n + 1) ** 2 - 2 * n

def east():
    for n in count():
        yield (2 * n + 1) ** 2

def south():
    for n in count():
        yield (2 * n + 1) ** 2 - 6 * n

def west():
    for n in count():
        yield (2 * n + 1) ** 2 - 4 * n


if __name__ == '__main__':
    print sum(chain(*(islice(i(), 1, 501) for i in [north, east, south, west]))) + 1


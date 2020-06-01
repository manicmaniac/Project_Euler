# coding:utf-8
"""
The first two consecutive numbers to have two distinct prime factors are:

14 = 2  7
15 = 3  5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2Â²  7  23
645 = 3  5  43
646 = 2  17  19.

Find the first four consecutive integers to have four distinct primes factors. What is the first of these numbers?
"""

from sympy import factorint
from itertools import count

for i in count(1):
    if all(len(factorint(j)) == 4 for j in range(i, i + 4)):
        print i
        break


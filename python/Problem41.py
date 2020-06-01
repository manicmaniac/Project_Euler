# coding:utf-8
"""
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
"""

from itertools import permutations
from sympy import *

def pandigitals(digits):
    for i in permutations(range(1, digits + 1)):
        yield int(''.join(map(str, i)))


if __name__ == '__main__':
    for i in range(1, 10):
        for n in pandigitals(i):
            if isprime(n):
                ans = n
    print(ans)

# coding:utf-8
"""
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
"""
from __future__ import division
from fractions import Fraction
from functools import reduce
from itertools import product
from operator import mul


if __name__ == '__main__':
    res = []
    for i, j, k in product(range(1, 10), repeat=3):
        d, n = (i * 10 + j, j * 10 + k)
        if d / n == i / k:
            res.append(Fraction(d, n))
    print(Fraction(reduce(mul, res)).denominator)

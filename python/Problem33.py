#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
'''
from fractions import Fraction

# ij / jk 
res = []
for i in range(1, 10):
    for j in range(1, 10):
        for k in range(1, 10):
            denominator =  float(str(i) + str(j))
            numerator = float(str(j) + str(k))
            if denominator < numerator:
                if denominator / numerator == float(str(i)) / float(str(k)):
                    res.append(Fraction('%s/%s' % (int(denominator), int(numerator))))
print str(Fraction(reduce(lambda x, y: x * y, res))).partition('/')[2]

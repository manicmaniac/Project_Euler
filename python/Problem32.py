#/usr/bin/env python
# -*- coding:utf-8 -*-
'''
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39  186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
'''
import itertools

res = []
permutation = [''.join(map(str, i)) for i in itertools.permutations([j for j in range(1, 10)])]
for i in permutation:
    if int(i[:1]) * int(i[1:5]) == int(i[5:9]): res.append(int(i[5:9]))
    if int(i[:2]) * int(i[2:5]) == int(i[5:9]): res.append(int(i[5:9]))
print sum(set(res))
#!/usr/bin/env python
# -*- coding:utf-8 -*-

#he sum of the squares of the first ten natural numbers is,
#12 + 22 + ... + 102 = 385
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)2 = 552 = 3025
#Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
#Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

# One Liner
print((lambda x: sum([i for i in range(1, x)]) ** 2 - sum([i ** 2 for i in range(1, x)])))(101)

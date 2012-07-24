#!/usr/bin/env python
# -*- coding:utf-8 -*-

#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.

from prime import genprime
from itertools import takewhile

if __name__ == '__main__':
    print sum(i for i in takewhile(lambda x: x<2000000, genprime()))

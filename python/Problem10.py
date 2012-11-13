#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
'''

from sympy import sieve

print sum(sieve.primerange(1, int(2e6)))


#!/usr/bin/env python
# -*- coding:utf-8 -*-

#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

from sympy import factorint
print max(factorint(600851475143).iterkeys())

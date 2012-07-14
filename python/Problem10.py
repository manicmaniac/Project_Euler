#!/usr/bin/env python
# -*- coding:utf-8 -*-

#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.

import prime

if __name__ == '__main__':
    ans = 0
    for i in prime.genprime():
        if i > 2000000: break
        print i
        ans += i
    print ans

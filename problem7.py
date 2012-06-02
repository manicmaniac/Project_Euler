#!/usr/bin/env python
# -*- coding:utf-8 -*-

#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#What is the 10001st prime number?

if __name__ == '__main__':
    import prime
    for i, j in enumerate(prime.genprime()):
        if i > 10000: break
        print j

#!/usr/bin/env python
# -*- coding:utf-8 -*-

def isprime(num):
    import math
    if num < 2: return False
    if num == 2: return True
    if not num % 2:
        return False
    for i in xrange(3, int(math.sqrt(num)) + 1, 2):
        if not num % i:
            return False
    return True

def genprime():
    yield 2
    yield 3
    yield 5
    i = 1
    while True:
        res = 6 * i + 1
        if isprime(res): yield res
        res = 6 * i + 5
        if isprime(res): yield res
        i += 1

def factorize(num):
    res = []
    if isprime(num):
        res.append(num)
        return res
    for i in genprime():
        if i * 2 - 1 > num: return res
        j = num
        while True:
            if not j % i:
                res.append(i)
                j /= i
            else: break


if __name__ == '__main__':
    def timing(f):
        import time
        def new_f(*args, **kwds):
            t = time.time()
            result = f(*args, **kwds)
            print ('%s: %ss'%(f.func_name, time.time()-t))
            return result
        return new_f

    @timing
    def main():
        for i in genprime():
            if i > 1000000: break
            print i

    main()

#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
The Fibonacci sequence is defined by the recurrence relation:

    F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.

It turns out that F[541], which contains 113 digits, is the first Fibonacci
number for which the last nine digits are 1-9 pandigital (contain all the
digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
digits, is the first Fibonacci number for which the first nine digits are 1-9
pandigital.

Given that F[k] is the first Fibonacci number for which the first nine digits
AND the last nine digits are 1-9 pandigital, find k.
'''
import threading
import math


# constants
LOG_PHI = math.log10((1 + math.sqrt(5)) / 2)
LOG_SQRT5 = math.log10(5) / 2


def upper_fibs():
    ''' terms of first 9 digits of fibonacci sequence '''
    i = 0
    while True:
        l = LOG_PHI * (i + 1) - LOG_SQRT5
        if l > 9:
            # take first 10 digits for precision
            l, _ = math.modf(l)
            l += 9
        # and drop last digits
        yield int(round(10 ** l) / 10)
        i += 1


def lower_fibs():
    ''' terms of last 9 digits of fibonacci sequence '''
    i, j = 0, 1
    while True:
        # take last 9 digits
        i, j = j, (i + j) % 10 ** 9
        yield i
    

def is_pandigital(n):
    ''' check if pandigital from 1 to 9 '''
    if n % 9:
        return False
    bits = 0
    while n:
        n, d = divmod(n, 10)
        bits |= 1 << d
    return bits == 0x3fe


if __name__ == '__main__':
    class Subthread(threading.Thread):
        ''' subthread to find first 9 digits pandigital fibonacci '''
        def __init__(self, results):
            super(Subthread, self).__init__()
            self.results = results
            self.did_found = threading.Event()

        def run(self):
            for i, fib in enumerate(upper_fibs(), 1):
                if self.did_found.is_set():
                    break
                if is_pandigital(fib):
                    if i in self.results:
                        print i
                        break
                    else:
                        self.results.append(i)
            self.stop()

        def stop(self):
            self.did_found.set()

    results = []
    subthread = Subthread(results)
    subthread.start()

    for i, fib in enumerate(lower_fibs(), 1):
        if not subthread.is_alive():
            break
        if is_pandigital(fib):
            if i in results:
                print i
                break
            else:
                results.append(i)
    subthread.stop()


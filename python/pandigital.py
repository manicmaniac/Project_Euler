#!/usr/bin/env python
# -*- coding:utf-8 -*-
from itertools import permutations

def gen_pandigital(start, end):
    for i in permutations(range(start, end + 1)):
        l = map(str, list(i[:]))
        yield int(''.join(l))

if __name__ == '__main__':
    for i in gen_pandigital(0, 9): print i

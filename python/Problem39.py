#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p  1000, is the number of solutions maximised?
'''
from math import hypot

def solution():
    for i in range(12, 1000, 12):
        acc = []
        for s in range(1, i):
            for t in range(s, i - s):
                u = hypot(s, t)
                if u.is_integer() and s + t + u == i:
                    acc.append((s, t, int(u)))
        if acc:
            yield len(acc), i


if __name__ == '__main__':
    print max(solution())[1]


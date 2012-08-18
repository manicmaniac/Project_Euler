#/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Three distinct points are plotted at random on a Cartesian plane, for which
-1000 ≤ x, y ≤ 1000, such that a triangle is formed.

Consider the following two triangles:

A(-340,495), B(-153,-910), C(835,-947)

X(-175,41), Y(-421,-714), Z(574,-645)

It can be verified that triangle ABC contains the origin, whereas triangle XYZ
does not.

Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file
containing the co-ordinates of one thousand "random" triangles, find the number
of triangles for which the interior contains the origin.

NOTE: The first two examples in the file represent the triangles in the example
given above.
'''

from sympy import *
import csv

FILE = './triangles.txt'

x = Symbol('x')
y = Symbol('y')

def contains_origin(a,b,c):
    res = (solve([a[0]*x+b[0]*y+c[0], a[1]*x+b[1]*y+c[1]], [x, y]))
    return min(res[x], res[y]) > 0

if __name__ == '__main__':
    rawdata = csv.reader(open(FILE))
    data = [map(int, i) for i in rawdata]
    res = 0
    for i in data:
        a = i[0:2]
        b = i[2:4]
        c = i[4:6]
        if contains_origin(a, b, c):
            res += 1
    print res

# coding:utf-8
r"""
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
"""

import csv


def cross_product(a, b):
    return (a.conjugate() * b).imag


def contains_origin(a, b, c):
    p = cross_product(a, b)
    q = cross_product(b, c)
    r = cross_product(c, a)
    return (p < 0 and q < 0 and r < 0) or (p >= 0 and q >= 0 and r >= 0)


if __name__ == '__main__':
    count = 0
    with open('../resources/triangles.txt') as f:
        for row in csv.reader(f):
            ax, ay, bx, by, cx, cy = map(int, row)
            a = complex(ax, ay)
            b = complex(bx, by)
            c = complex(cx, cy)
            if contains_origin(a, b, c):
                count += 1
    print(count)

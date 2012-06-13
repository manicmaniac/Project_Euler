#!/usr/bin/env python
# -*- coding:utf-8 -*-
'''
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
'''
class Matrix(object):
    def sumdiagon(self):
        tl = []
        tr = []
        for i in range(self.width):
            tl.append(self.matrix[i][i])  #topleft to bottomright
        for i in range(self.width):
            tr.append(self.matrix[self.width - 1 - i][i])
        return sum(tl + tr) - 1

    def __init__(self, width):
        self.width = width
        self.matrix = []
        for i in range(width):
            self.matrix.append([])
            for j in range(width):
                self.matrix[i].append([])
class Dot(object):
    def _direct(self):
        res = [i / 2 for i in range(2, self.objmatrix.width * 2 + 1)]
        res2 = []
        for i in range(2, self.objmatrix.width * 2):
            res2.append('right')
            res2.append('below')
            res2.append('left')
            res2.append('above')
        return zip(res2, res)

    def put(self):
        self.objmatrix.matrix[self.y][self.x] = self.value.next()
    def goright(self): self.x += 1
    def gobelow(self): self.y += 1
    def goleft(self): self.x -= 1
    def goabove(self): self.y -= 1

    def run(self):
        for i in self.direction:
            if i[0] == 'right':
                for j in range(i[1]):
                    self.put()
                    self.goright()
            elif i[0] == 'below':
                for j in range(i[1]):
                    self.put()
                    self.gobelow()
            elif i[0] == 'left':
                for j in range(i[1]):
                    self.put()
                    self.goleft()
            elif i[0] == 'above':
                for j in range(i[1]):
                    self.put()
                    self.goabove()

    def __init__(self, objmatrix):
        self.objmatrix = objmatrix
        self.x = objmatrix.width / 2
        self.y = objmatrix.width / 2
        self.value = iter(range(1, objmatrix.width ** 2 + 1))
        self.direction = self._direct()


if __name__ == '__main__':
    m = Matrix(1001)
    d = Dot(m)
    d.run()
    print m.sumdiagon()

'''
By starting at the top of the triangle below and moving to adjacent numbers on
the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click and
'Save Link/Target As...'), a 15K text file containing a triangle with
one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not possible
to try every route to solve this problem, as there are 2^99 altogether! If you
could check one trillion (10^12) routes every second it would take over twenty
billion years to check them all. There is an efficient algorithm to solve it. ;
o)
'''

import copy

class Pyramid(object):
    def inputdata(self):
        lines = self.rawdata.splitlines()
        for i in range(len(lines)):
            tmp = (lines[i].split())
            self.lines.append(map(int, tmp))
        self.tmplines = copy.copy(self.lines)

    def solution(self):
        for i in reversed(range(len(self.lines))):
            for j in range(len(self.lines[i])):
                if i >= 0 and j - 1 >= 0:
                    self.tmplines[i - 1][j - 1] += max(self.tmplines[i][j], self.tmplines[i][j - 1])
        return self.tmplines[0][0]

    def __init__(self, rawdata):
        self.rawdata = rawdata
        self.lines = []
        self.inputdata()

if __name__ == '__main__':
    FILE = '../resources/triangle.txt'
    with open(FILE) as f:
        data = f.read()
    p = Pyramid(data)
    print p.solution()


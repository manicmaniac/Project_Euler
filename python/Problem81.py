# coding:utf-8
"""
In the 5 by 5 matrix below, the minimal path sum from the top left to the
bottom right, by only moving to the right and down, is indicated in bold red
and is equal to 2427.

    131 673 234 103 18

    201 96  342 965 150

[b] 630 803 746 422 111  [b]

    537 699 497 121 956

    805 732 524 37  331


Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target
As...'), a 31K text file containing a 80 by 80 matrix, from the top left to the
bottom right by only moving right and down.
"""

FILE = '../resources/matrix.txt'

with open(FILE) as f:
    rawdata = f.read()

data = [map(int, line.split(',')) for line in rawdata.replace('\r', '').splitlines()]

for y in range(len(data)):
    for x in range(len(data)):
        if x * y:
            data[y][x] += min(data[y - 1][x], data[y][x - 1])
        elif not x + y:
            continue
        elif not x:
            data[y][x] += data[y - 1][x]
        elif not y:
            data[y][x] += data[y][x - 1]

print data[-1][-1]


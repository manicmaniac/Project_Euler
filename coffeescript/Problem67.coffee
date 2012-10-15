###
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
###

fs = require('fs')

FILE = './triangle.txt'

rawdata = fs.readFileSync(FILE, 'ascii').replace(/\r/g, '').slice(0, -1)

pyramid = rawdata.split('\n').map((x) -> x.split(' ').map(Number))
pyramid.reverse()

for line, y in pyramid
	if y > 0 then for elem, x in line
		pyramid[y][x] += Math.max(pyramid[y - 1][x..x + 1]...)

console.log pyramid[pyramid.length - 1][0]


###
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
###

fs = require('fs')
_ = require('underscore')

FILE = '../resources/matrix.txt'

rawdata = fs.readFileSync(FILE, 'ascii')
data = rawdata.replace(/\r/g, '').split('\n').map((x) -> x.split(',').map(Number))
data.pop()

for y in [0...data.length]
    for x in [0...data.length]
        if x * y
            data[y][x] += Math.min(data[y - 1][x], data[y][x - 1])
        else unless x + y
            continue
        else unless x
            data[y][x] += data[y - 1][x]
        else unless y
            data[y][x] += data[y][x - 1]

console.log _(data.reverse()).invoke('reverse')[0][0]


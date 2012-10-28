###
The cube, 41063625 (345^3), can be permuted to produce two other cubes:
56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube
which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are
cube.
###

Bigint = require('bigint')
_ = require('underscore')

cube = (n) -> Bigint.pow n, 3

sortDigits = (n) -> (i for i in String n).sort().join('')

minKey = (value, obj) -> (k for k, v of obj when v == value)[0]

cache = {}
i = 0
loop
	i++
	c = cube i
	current = sortDigits c
	cache[String c] = current
	if _(cache).values().filter((x) -> x == current).length == 5
		console.log minKey(current, cache)
		break


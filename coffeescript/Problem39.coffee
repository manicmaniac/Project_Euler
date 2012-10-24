###
If p is the perimeter of a right angle triangle with integral length sides, {a,
b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
###

_ = require('underscore')

findPythagorean = (p) ->
	res = []
	for a in [1...p]
		for b in [1..a]
			c = Math.sqrt(a * a + b * b)
			if a + b + c == p
				res.push [a, b, c]
	res



console.log _([12..1000]).max((x) -> findPythagorean(x).length)


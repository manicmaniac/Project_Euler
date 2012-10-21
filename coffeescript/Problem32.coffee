###
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can
be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only
include it once in your sum.
###

itertools = require('itertools')
_ = require('underscore')

permutations = itertools.permutationsSync([1..9]).map((x) -> x.join(''))
res = []

for i in permutations
	current = (Number i[5..9])
	if (Number i[0]) * (Number i[1..4]) == current
		res.push(current)
	if (Number i[0..1]) * (Number i[2..4]) == current
		res.push(current)

console.log _.unique(res).reduce((x, y) -> x + y)


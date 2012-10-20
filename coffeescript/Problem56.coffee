###
A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^
100 is almost unimaginably large: one followed by two-hundred zeros. Despite
their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, a^b, where a, b < 100, what is the
maximum digital sum?
###

Bigint = require('bigint')

sumDigits = (n) ->
	((Number i) for i in (String n)).reduce((x, y) -> x + y)

max = 0
for a in [1..99]
	for b in [1..99]
		current = sumDigits Bigint.pow(a, b)
		max = current if max < current
console.log max


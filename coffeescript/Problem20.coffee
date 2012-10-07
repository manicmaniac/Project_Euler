###
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
###

bigint = require('bigint')

factorial = (x) ->
	[n, res] = [bigint(x), bigint(1)]
	while n.gt(1)
		res = res.mul(n)
		n = n.sub(1)
	res.toString()
	

console.log((Number(i) for i in factorial(100)).reduce((x, y) -> x + y))


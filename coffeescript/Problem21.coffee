###
Let d(n) be defined as the sum of proper divisors of n (numbers less than n
which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
###

proper_divisors = (n) ->
	if n == 1 then [1] else [1...n].filter((x) -> n % x == 0)

has_amicable = (n) ->
	spd = proper_divisors(n).reduce((x, y) -> x + y)
	spd != n and proper_divisors(spd).reduce((x, y) -> x + y) == n

console.log([2..9999].filter(has_amicable).reduce((x, y) -> x + y))


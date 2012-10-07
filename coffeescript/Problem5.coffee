###
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
###

gcd = (m, n) ->
	if n == 0 then m else if m < n then gcd(n, m) else gcd(n, m % n)

lcm = (m, n) -> m * n / gcd(m, n)

console.log([1..20].reduce(lcm))


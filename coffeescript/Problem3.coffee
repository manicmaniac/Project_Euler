###
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
###

factorize = (n) ->
	[d, res] = [2, []]
	while n >= d
		if n % d then d++ else [n, res] = [n / d, res.concat(d)]
	res

console.log Math.max(factorize(600851475143)...)


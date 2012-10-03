###
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
###

factorize = (n, d=2, res=[]) ->
	if n < d
		res
	else
		if n % d == 0
			factorize(n / d, d, res.concat(d))
		else
			factorize(n, d + 1, res)

console.log(Math.max.apply(null, factorize(600851475143)))


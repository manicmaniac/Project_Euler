###
The number, 197, is called a circular prime because all rotations of the
digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
73, 79, and 97.

How many circular primes are there below one million?
###

rotations = (n) ->
	res = []
	digits = (i for i in String(n))
	for i in [1..digits.length]
		res.push(Number(digits.reduce((x, y) -> x + y)))
		digits.push(digits.shift())
	res

sieve = (limit) ->
	primes = []
	search = [2..limit]
	while true
		current = search[0]
		primes.push(current)
		search = search.filter((x) -> x % current != 0)
		if Math.pow(primes[primes.length - 1], 2) > search[search.length - 1]
			return primes.concat(search)

allIn = (xs, from) ->
	for i in xs
		return false unless i in from
	return true

primeList = sieve(1e6)

ans = 0
for i in primeList
	if allIn(rotations(i), primeList)
		ans++
console.log ans


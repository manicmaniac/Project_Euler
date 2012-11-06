###
The number, 197, is called a circular prime because all rotations of the
digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
73, 79, and 97.

How many circular primes are there below one million?
###

rotations = (n) ->
	res = []
	digits = (i for i in String n)
	for i in [1..digits.length]
		res.push Number digits.join ''
		digits.push digits.shift()
	res

sieve = (limit) ->
	[primes, search] = [[], [2..limit]]
	loop
		current = search[0]
		primes.push current
		search = search.filter (x) -> x % current
		if Math.pow(primes[primes.length - 1], 2) > search[search.length - 1]
			return primes.concat search

candidates = [2].concat sieve(1e6).filter (x) -> (i for i in String x).every (x) -> x % 2

console.log (candidates.filter (x) -> rotations(x).every (y) -> y in candidates).length


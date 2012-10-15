###
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
###

sieve = (limit) ->
	primes = []
	search = [2..limit]
	while true
		current = search[0]
		primes.push(current)
		search = search.filter((x) -> x % current != 0)
		if Math.pow(primes[primes.length - 1], 2) > search[search.length - 1]
			return primes.concat(search)

console.log sieve(2000000).reduce((x, y) -> x + y)


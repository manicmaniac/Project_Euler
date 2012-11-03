###
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
###

sieve = (limit) ->
	primes = []
	search = [2..limit]
	loop
		current = search[0]
		primes.push current
		search = search.filter (x) -> x % current
		if Math.pow(primes[primes.length-1], 2) > search[search.length-1]
			return primes.concat search

console.log sieve(2e6).reduce (x, y) -> x + y


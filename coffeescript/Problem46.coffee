###
It was proposed by Christian Goldbach that every odd composite number can be
written as the sum of a prime and twice a square.

9 = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime
and twice a square?
###

isPrime = (n) ->
	return false if n < 2
	return true if n == 2
	for i in [2..Math.sqrt n]
		return false unless n % i
	true

_primes = (n=1) -> ->
	n++;
	n++ until isPrime n; n

_doubleSquares = (n=0) -> -> ++ n * n * 2

primeRange = (n) ->
	primes = _primes()
	x while (x = primes()) < n

squareRange = (n) ->
	doubleSquares = _doubleSquares()
	x while (x = doubleSquares()) < n

isGoldbachComposite = (n) ->
	return true if isPrime n
	for prime in primeRange n
		for square in squareRange n
			return true if prime + square == n
	false

count = do (n=0) -> -> ++ n

loop
	x = count() * 2 + 5
	unless isGoldbachComposite x
		console.log x
		break


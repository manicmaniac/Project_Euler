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

isPrime = (n) -> not (n - 2) or [2..Math.sqrt n].every (x) -> n % x

_doubleSquares = (n=0) -> -> ++ n * n * 2

primeRange = (n) ->
	[2..n].filter isPrime

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

console.log do ->
	loop
		x = count() * 2 + 5
		unless isGoldbachComposite x
			return x

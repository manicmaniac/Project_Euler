###
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
###

isPrime = (n) ->
	return true if n == 2
	for i in [2..Math.sqrt(n)]
		return false if n % i == 0
	true

primes = do (i=2) -> -> i++ until isPrime(i); i++

primes() for i in [1..10000]
console.log primes()


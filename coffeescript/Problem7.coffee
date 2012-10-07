###
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
###

is_prime = (n) ->
	if n == 2 then return true
	for i in [2..Math.sqrt(n)]
		if n % i == 0 then return false
	return true

_primes = (i=2) ->
	-> i++ until is_prime(i); i++
primes = _primes()

for i in [1..10000] then primes()
console.log(primes())


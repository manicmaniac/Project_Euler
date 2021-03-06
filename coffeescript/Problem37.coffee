###
The number 3797 has an interesting property. Being prime itself, it is possible
to continuously remove digits from left to right, and remain prime at each
stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797,
379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to
right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
###

_ = require('underscore')

isPrime = (n) -> not (n - 2) or [2..Math.sqrt n].every (x) -> n % x

trunc = (n) ->
	digits = (i for i in String n)
	ltor = (digits[0...i] for i in [1..digits.length-1])
	digits.reverse()
	rtol = (digits[0...i].reverse(false) for i in [1..digits.length-1])
	_(ltor.concat rtol).invoke('join', '').map Number

console.log do (res=[], i=9) ->
	while res.length < 11
		i += 2
		res.push i if [i].concat(trunc i).every isPrime
	res.reduce (x, y) -> x + y


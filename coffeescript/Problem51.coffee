###
By replacing the 1^st digit of *3, it turns out that six of the nine possible
values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3^rd and 4^th digits of 56**3 with the same digit, this
5-digit number is the first example having seven primes among the ten generated
numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and
56993. Consequently 56003, being the first member of this family, is the
smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not necessarily
adjacent digits) with the same digit, is part of an eight prime value family.
###

_ = require('underscore')

isPrime = (n) -> not (n - 2) or [2..Math.sqrt n].every (x) -> n % x

replacedIsPrime = (n, repl) ->
	[repl..9].filter((x) ->
		isPrime((String n).replace(new RegExp(repl, 'g'), String x))).length

hasReplaceableDigit = (n) ->
	digits = (Number i for i in String n)
	if _.min(digits) > 2
		0
	else
		for i in [2, 1, 0]
			if digits.filter((x) -> x == i).length > 1
				return replacedIsPrime(n, i)

console.log do ->
	i = 0
	loop
		i++
		if isPrime(i) and hasReplaceableDigit(i) > 7
			return i



###
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
also prime.

What is the largest n-digit pandigital prime that exists?
###

itertools = require('itertools')
_ = require('underscore')

isPrime = (n) ->
	return false if n < 2
	return true if n == 2
	for i in [2..Math.sqrt n]
		return false unless n % i
	true

candidatesFrom = (arr) ->
	return [] unless arr.reduce((x, y) -> x + y) % 3
	blacklist = [0, 2, 4, 5, 6, 8]
	perms = itertools.permutationsSync(arr).filter((x) -> _.last(x) not in blacklist)
	_(perms).invoke('join', '')

for i in [1..9]
	for n in candidatesFrom [1..i]
		ans = n if isPrime n
console.log ans


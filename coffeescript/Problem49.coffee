###
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
by 3330, is unusual in two ways: (i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this
sequence?
###

_ = require('underscore')

isPermutations = (xs) ->
	_.uniq((i for i in String x).sort().join('') for x in xs).length == 1

isPrime = (n) ->
	return false if n < 2
	return true if n == 2
	for i in [2..Math.sqrt n]
		return false unless n % i
	true

primeList = [1..3333].filter isPrime

seq = ->
	res = []
	for i in primeList
		if i > 1000
			for j in [1000..3333] by 2
				if [i + j, i + j * 2].every isPrime
					seq = [i, i + j, i + j * 2]
					res.push seq
	res

console.log seq().filter(isPermutations)[1].join('')


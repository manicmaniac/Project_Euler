###
Pentagonal numbers are generated by the formula, P[n]=n(3n−1)/2. The first ten
pentagonal numbers are:

1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

It can be seen that P[4] + P[7] = 22 + 70 = 92 = P[8]. However, their
difference, 70 − 22 = 48, is not pentagonal.

Find the pair of pentagonal numbers, P[j] and P[k], for which their sum and
difference is pentagonal and D = |P[k] − P[j]| is minimised; what is the value
of D?
###

_penta = (n=1) -> -> n * (3 * n++ - 1) / 2
penta = _penta()

isPentagonal = (n) ->
	res = (Math.sqrt(24 * n + 1) + 1) / 6
	res == Math.floor(res)

cache = []
until ans
	curr = penta()
	for i in cache
		ans = curr - i if [curr - i, curr + i].every(isPentagonal)
	cache.unshift(curr)

console.log ans


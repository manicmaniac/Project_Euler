###
There are exactly ten ways of selecting three from five, 12345:

123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

In combinatorics, we use the notation, ^5C[3] = 10.

In general,

^nC[r] = n!       ,where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
         r!(n−r)!

It is not until n = 23, that a value exceeds one-million: ^23C[10] = 1144066.

How many, not necessarily distinct, values of  ^nC[r], for 1 ≤ n ≤ 100, are
greater than one-million?
###

factorial = (n) -> if n < 2 then 1 else [2..n].reduce((x, y) -> x * y)

c = (n, r) -> factorial(n) / (factorial(r) * factorial(n - r))

count = 0
for n in [23..100]
	for r in [1...n]
		count++ if c(n, r) > 1e6
console.log count


###
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number. For example, the sum of the proper divisors of 28
would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
number that can be written as the sum of two abundant numbers is 24. By
mathematical analysis, it can be shown that all integers greater than 28123 can
be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest
number that cannot be expressed as the sum of two abundant numbers is less than
this limit.

Find the sum of all the positive integers which cannot be written as the sum of
two abundant numbers.
###

###
properDivisors = (n) ->
	if n > 1 then [1...n].filter((x) -> !(n % x)) else [1]
###

LIMIT = 28123

properDivisors = (n) ->
	res = [1]
	if n > 2 then for i in [2..Math.sqrt(n)]
		if !(n % i)
			if i != n / i
				res = res.concat([i, n / i])
			else
				res.push(i)
	res

isAbundant = (n) ->
	if n % 2 * n % 5 then return false
	n < properDivisors(n).reduce((x, y) -> x + y)

abundants = [1..LIMIT].filter(isAbundant)

twoAbundants = []
for i in abundants
	for j in abundants
		break if j > i or i + j > LIMIT
		twoAbundants.push(i + j)

ans = 0
for i in [1..LIMIT]
	if i in twoAbundants
	else
		ans += i
console.log ans


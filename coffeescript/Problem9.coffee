###
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
###

for m in [1..23]
	for n in [1..m]
		triplet = [m*m-n*n, 2*m*n, m*m+n*n]
		if triplet.reduce((x, y) -> x + y) == 1000
			console.log triplet.reduce((x, y) -> x * y)
			break


###
The fraction ^49/[98] is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that ^49/[98] = ^4/[8],
which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, ^30/[50] = ^3/[5], to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than
one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms,
find the value of the denominator.
###

gcd = (a, b) -> b and gcd(b, a % b) or a

# ij / jk
res = []
for i in [1..9]
	for j in [1..9]
		for k in [1..9]
			nume = [i, j].join ''
			deno = [j, k].join ''
			if nume < deno and nume / deno == i / k
				res.push [nume, deno]

nume = (i[0] for i in res).reduce (x, y) -> (x * y)
deno = (i[1] for i in res).reduce (x, y) -> (x * y)

console.log Math.max(nume, deno) / gcd nume, deno


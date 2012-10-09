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

class Rational extends Number
	constructor: (@numer, @denom) ->

	toString: ->
		div = gcd(@numer, @denom)
		[numer, denom] = [@numer / div, @denom / div]
		if denom == 1
			"#{numer}"
		else
			"#{numer}/#{denom}"

	toDouble: -> @numer / @denom
	valueOf: -> @numer / @denom

	gcd = (s, t) ->
		return gcd(t, s) if s < t
		if t == 0 then s else gcd(t, s % t)

console.log new Rational(12, 1).toString()
console.log new Rational(12, 21) + 1


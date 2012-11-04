/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can
be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only
include it once in your sum.
*/

var itertools = require('itertools');
var _ = require('underscore');

var permutations = itertools.permutationsSync(_.range(1, 10)).map(function(x) {
	return x.join('');
});

console.log((function() {
	var res = [], current;
	permutations.forEach(function(x) {
		current = Number(x.slice(5, 10));
		if (Number(x[0]) * Number(x.slice(1, 5)) === current) {
			res.push(current);
		}
		if (Number(x.slice(0, 2)) * Number(x.slice(2, 5)) === current) {
			res.push(current);
		}
	});
	return _(res).uniq().reduce(function(x, y) {
		return x + y;
	});
}()));


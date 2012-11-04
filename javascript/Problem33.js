/*
The fraction ^49/[98] is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that ^49/[98] = ^4/[8],
which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, ^30/[50] = ^3/[5], to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than
one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms,
find the value of the denominator.
*/

var gcd = function(x, y) {
	return x < y ? gcd(y, x) : y === 0 ? x : gcd(y, x % y);
};

console.log((function() {
	var res = [], ans;
	for (i=1; i<10; i++) {
		for (j=1; j<10; j++) {
			for (k=1; k<10; k++) {
				n = Number([i, j].join(''));
				d = Number([j, k].join(''));
				if (n < d && n / d === i / k) {
					res.push([n, d]);
				}
			}
		}
	}
	ans = res.reduce(function(x, y) {
		return [x[0] * y[0], x[1] * y[1]];
	});
	return Math.max.apply(null, ans) / gcd(ans[0], ans[1]);
}()));


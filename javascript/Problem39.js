/*
If p is the perimeter of a right angle triangle with integral length sides, {a,
b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
*/

var _ = require('underscore');

var findPythagorean = function(p) {
	var res = [], a, b, c;
	_.range(1, p + 1).forEach(function(a) {
		_.range(1, a + 1).forEach(function(b) {
			c = Math.sqrt(a * a + b * b);
			if (a + b + c === p) {
				res.push([a, b, c]);
			}
		});
	});
	return res;
};

console.log((function() {
	return _(_.range(12, 1001)).max(function(x) {
		return findPythagorean(x).length;
	});
}()));


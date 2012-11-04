/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of
their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/

var _ = require('underscore');

var factorial = _.range(10).map(function loop(n) {
	return n < 2 ? 1 : loop(n - 1) * n;
});

var isCurious = function(n) {
	return [].map.apply(String(n), [function(x) {
		return factorial[x];
	}]).reduce(function(x, y) {
		return x + y;
	}) === n;
};

console.log(_.range(3, factorial[9] * 7).filter(isCurious).reduce(function(x, y) {
	return x + y;
}));


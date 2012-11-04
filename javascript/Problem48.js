/*
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
*/

var Bigint = require('bigint');
var _ = require('underscore');

console.log(_.range(1, 1001).reduce(function(x, y) {
		return String(Bigint(x).add(Bigint.pow(y, y)));
	}).substr(-10, 10));


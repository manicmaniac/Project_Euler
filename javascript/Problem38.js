/*
Take the number 192 and multiply it by each of 1, 2, and 3:

    192 × 1 = 192
    192 × 2 = 384
    192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576. We will
call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and
5, giving the pandigital, 918273645, which is the concatenated product of 9 and
(1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?
*/

var _ = require('underscore');

var isPandigital = function(n) {
	return [].map.apply(String(n), [_.identity]).sort().join('') === '123456789';
};

var concatProduct = function(n) {
	return (function loop(n, i, res) {
		var len = String(res).length;
		return len === 9 ? Number(res) : len > 9 ? 0 : loop(n, i + 1, (res + String(n * i)));
	}(n, 1, ''));
};

console.log((function() {
	return _(_.range(1, 9877).map(concatProduct)).max(function(x) {
		return isPandigital(x) ? x : 0;
	});
}()));


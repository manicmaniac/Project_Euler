/*
The number 3797 has an interesting property. Being prime itself, it is possible
to continuously remove digits from left to right, and remain prime at each
stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797,
379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to
right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/

var _ = require('underscore');

var isPrime = function(n) {
	if (n < 2) {
		return false;
	}
	if (n === 2) {
		return true;
	}
	return !(_.range(2, Math.sqrt(n) + 1).some(function(x) {
		return n % x === 0;
	}));
};

var trunc = function(n) {
	var digits = [].map.apply(String(n), [_.identity]);
	var ltor = _.range(1, digits.length).map(function(x) {
		return digits.slice(0, x);
	});
	digits.reverse();
	var rtol = _.range(1, digits.length).map(function(x) {
		return digits.slice(0, x).reverse(false);
	});
	return ltor.concat(rtol).map(function(x) {
		return Number(x.join(''));
	});
};

console.log((function() {
	var res = [], i = 9;
	while (res.length < 11) {
		i += 2;
		if (isPrime(i) && trunc(i).every(isPrime)) {
			res.push(i);
		}
	}
	return res.reduce(function(x, y) {
		return x + y;
	});
}()));


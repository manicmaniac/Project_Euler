/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
also prime.

What is the largest n-digit pandigital prime that exists?
*/

var itertools = require('itertools');
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

var candidatesFrom = function(arr) {
	var blacklist = [0, 2, 4, 5, 6, 8], perms;
	if (arr.reduce(function(x, y) {
		return x + y;
	}) % 3 === 0) {
		return [];
	}
	perms = itertools.permutationsSync(arr).filter(function(x) {
		return !_(blacklist).contains(_.last(x));
	});
	return _(perms).invoke('join', '');
};

console.log((function() {
	var ans;
	_.range(1, 10).forEach(function(i) {
		candidatesFrom(_.range(1, i + 1)).forEach(function(n) {
			if (isPrime(n)) {
				ans = n;
			}
		});
	});
	return ans;
}()));


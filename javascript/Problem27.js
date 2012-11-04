/*
Euler published the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values
n = 0 to 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is
divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible
by 41.

Using computers, the incredible formula  n² − 79n + 1601 was discovered, which
produces 80 primes for the consecutive values n = 0 to 79. The product of the
coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

    n² + an + b, where |a| < 1000 and |b| < 1000

    where |n| is the modulus/absolute value of n
    e.g. |11| = 11 and |−4| = 4

Find the product of the coefficients, a and b, for the quadratic expression
that produces the maximum number of primes for consecutive values of n,
starting with n = 0.
*/

var _ = require('underscore');

var Formula = function(a, b) {
	this.a = a;
	this.b = b;
};

Formula.prototype = {
	n: function(n) {
		return n * (n + this.a) + this.b;
	},
	length: function() {
		var i = 0;
		while (isPrime(this.n(i))) {
			i ++;
		}
		return i;
	}
};

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

var primeList = _.range(1, 1e3).filter(isPrime);

var MAX = 999, MIN = -MAX;

console.log((function() {
	var maxLength = 0, a, current, ans;
	var loop = function(b) {
		current = new Formula(a, b).length();
		if (current > maxLength) {
			maxLength = current;
			ans = a * b;
		}
	};
	for (a=MIN; a<MAX; a++) {
		primeList.forEach(loop);
	}
	return ans;
}()));


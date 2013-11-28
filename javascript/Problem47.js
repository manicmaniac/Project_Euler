/*
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct primes factors.
What is the first of these numbers?
*/

var _ = require('underscore');

function isPrime(n) {
	if (n < 2) {
		return false;
	}
	if (n === 2) {
		return true;
	}
	return !(_.range(2, Math.sqrt(n) + 1).some(function(x) {
		return n % x === 0;
	}));
}

function factorize(n) {
  var res = {},
      d = 2;
	if (isPrime(n)) {
		return res;
	}
  while (n >= d) {
    if (n % d === 0) {
      res[d] = (res[d] + 1) || 1;
      n /= d;
    } else {
      d++;
    }
  }
  return res;
}

console.log((function() {
  var conditional = function(x) {
    return [x, x + 1, x + 2, x + 3].every(function(x) {
      return Object.keys(factorize(x)).length === 4;
    });
  };
  var i = 0;
  while (!(conditional(i++)));

  return i;
}()));


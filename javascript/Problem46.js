/*
It was proposed by Christian Goldbach that every odd composite number can be
written as the sum of a prime and twice a square.

9 = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime
and twice a square?
*/

var _ = require('underscore');

var isPrime = function(n) {
  if (n < 2) {
    return false;
  }
  if (n === 2) {
    return true;
  }
  return !_.range(2, Math.sqrt(n) +1).some(function(x) {
    return n % x === 0;
  });
};

function sieve(limit) {
  var primes = [],
      search = _.range(2, limit),
      current;

  function cannotDivide(n) {
    return n % current !== 0;
  }

  while (true) {
    current = search[0];
    primes.push(current);
    search = search.filter(cannotDivide);
    if (Math.pow(primes[primes.length - 1], 2) > search[search.length - 1]) {
      return primes.concat(search);
    }
  }
}

var squareRange = function(n) {
  return (function() {
    var i, res = [];
    for (i=0; i*i<n; i++) {
      res.push(i * i * 2);
    }
    return res;
  }());
};

var isGoldbachComposite = function(n) {
  if (isPrime(n)) {
    return true;
  }
  return sieve(n).some(function(prime) {
    return squareRange(n).some(function(square) {
      return prime + square === n;
    });
  });
};

console.log((function() {
  var i;
  for (i=7; isGoldbachComposite(i); i+=2);

  return i;
}()));


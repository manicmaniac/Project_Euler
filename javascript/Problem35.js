/*
The number, 197, is called a circular prime because all rotations of the
digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
73, 79, and 97.

How many circular primes are there below one million?
*/

var _ = require('underscore');

function rotations(n) {
  var res = [],
      digits = String(n).split('');

  _(digits.length).times(function() {
    res.push(Number(digits.join('')));
    digits.push(digits.shift());
  });
  return res;
}

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


console.log((function() {
  var candidates = [2].concat(sieve(1e6).filter(function(x) {
    return String(x).split('').every(function(y) {
      return y % 2;
    });
  }));
  return candidates.filter(function(x) {
    return rotations(x).every(function(y) {
      return candidates.indexOf(y) > -1;
    });
  }).length;
}()));


/*
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
by 3330, is unusual in two ways: (i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this
sequence?
*/

var _ = require('underscore');

var MAX = Math.ceil(1e4 / 3),
    MIN = 1e3;

function isPermutations(xs) {
  return _.uniq(xs.map(function(x) {
    return String(x).split('').sort().join('');
  })).length === 1;
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

var isPrime = function(n) {
  if (n < 2) {
    return false;
  }
  if (n === 2) {
    return true;
  }
  return !_.range(2, Math.sqrt(n) + 1).some(function(x) {
    return n % x === 0;
  });
};
isPrime = _.memoize(isPrime);

var primeList = sieve(MAX);

var sequences = (function() {
  var res = [];
  primeList.forEach(function(prime) {
    if (prime > MIN) {
      _.range(MIN, MAX, 2).forEach(function(margin) {
        var a = prime,
            b = prime + margin,
            c = prime + margin * 2;
        if ([b, c].every(isPrime)) {
          res.push([a, b, c]);
        }
      });
    }
  });
  return res;
}());

console.log(sequences.filter(isPermutations)[1].join(''));


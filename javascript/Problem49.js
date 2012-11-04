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

var isPermutations = function(xs) {
  return _.uniq(xs.map(function(x) {
    return [].map.apply(String(x), [_.identity]).sort().join('');
  })).length === 1;
};

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

var primeList = _.range(1, 3334).filter(isPrime);

var sequences = (function() {
  var res = [], seq;
  primeList.forEach(function(i) {
    if (i > 1e3) {
      _.range(1e3, 3334, 2).forEach(function(j) {
        if ([i + j, i + j * 2].every(isPrime)) {
          seq = [i, i + j, i + j * 2];
          res.push(seq);
        }
      });
    }
  });
  return res;
}());

console.log(sequences.filter(isPermutations)[1].join(''));


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

var factorize = function(n) {
  var res = [], d = 2;
  while (n >= d) {
    if (n % d === 0) {
      res.push(d);
      n /= d;
    }
    else {
      d ++;
    }
  }
  return res;
};

console.log((function() {
  var conditional = function(x) {
    return [x, x + 1, x + 2, x + 3].every(function(x) {
      return _.uniq(factorize(x)).length === 4;
    });
  };
  var i = 0;
  while (!(conditional(i))) {
    i++;
  }
  return i;
}()));


/*
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number. For example, the sum of the proper divisors of 28
would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
number that can be written as the sum of two abundant numbers is 24. By
mathematical analysis, it can be shown that all integers greater than 28123 can
be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest
number that cannot be expressed as the sum of two abundant numbers is less than
this limit.

Find the sum of all the positive integers which cannot be written as the sum of
two abundant numbers.
*/

var _ = require('underscore');

var LIMIT = 28123;

var properDivisors = function(n) {
  var res = [1];
  if (n > 2) {
    _.range(2, Math.sqrt(n)).forEach(function(x) {
      if (n % x === 0) {
        if (x !== n / x) {
          res = res.concat([x, n / x]);
        }
        else {
          res.push(x);
        }
      }
    });
  }
  return res;
};

var isAbundant = function(n) {
  return n % 2 * n % 5 === 0 && n < properDivisors(n).reduce(function(x, y) {
    return x + y;
  });
};

var abundants = _.range(1, LIMIT).filter(isAbundant);

var twoAbundants = (function() {
  var res = [], i, j, s, t, len;
  for (i=0, len=abundants.length; i<len; i++) {
    s = abundants[i];
    for (j=0; j<len; j++) {
      t = abundants[j];
      if (t > s || s + t > LIMIT) {
        break;
      }
      res.push(s + t);
    }
  }
  return res;
}());

console.log((function() {
  return _.range(1, LIMIT).filter(function(x) {
    return _(twoAbundants).contains(x);
  }).length;
}()));



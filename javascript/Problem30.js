/*
Surprisingly there are only three numbers that can be written as the sum of
fourth powers of their digits:

    1634 = 1^4 + 6^4 + 3^4 + 4^4
    8208 = 8^4 + 2^4 + 0^4 + 8^4
    9474 = 9^4 + 4^4 + 7^4 + 4^4

As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers
of their digits.
*/

var _ = require('underscore');
_.mixin(require('underscore.string'));


var is5thPowers = function(n) {
  return (_(n).chars().map(function(x) {
    return Math.pow(x, 5);
  })).reduce(function(x, y) {
    return x + y;
  }) === n;
};

console.log(_.range(2, Math.pow(9, 5) * 6).filter(is5thPowers).reduce(function(x, y) {
  return x + y;
}));


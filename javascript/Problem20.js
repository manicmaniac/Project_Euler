/*
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
*/

var Bigint = require('bigint');
var _ = require('underscore');

var factorial = function(n) {
  return n < 2 ? 1 : _.range(1, n + 1).reduce(Bigint.mul);
};

var digits = function(n) {
  return String(n).split('').map(Number);
};

console.log((digits(factorial(100))).reduce(function(x, y) {
  return x + y;
}));


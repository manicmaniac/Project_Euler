/*
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/

var bigint = require('bigint');

var digits = function(n) {
  return String(n).split('').map(Number);
};

console.log((digits(bigint.pow(2, 1e3))).reduce(function(x, y) {
  return x + y;
}));


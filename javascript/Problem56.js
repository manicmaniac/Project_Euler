/*
A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^
100 is almost unimaginably large: one followed by two-hundred zeros. Despite
their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, a^b, where a, b < 100, what is the
maximum digital sum?
*/

var Bigint = require('bigint');
var _ = require('underscore');

console.log((function() {
  var sumDigits = function(n) {
    return String(n).split('').map(Number).reduce(function(x, y) {
      return x + y;
    });
  };
  var range = _.range(1, 100);
  return _(range.map(function(a) {
    return range.map(function(b) {
      return sumDigits(Bigint.pow(a, b));
    });
  })).chain().flatten().max().value();
}()));


/*
The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in
base 10 and base 2.

(Please note that the palindromic number, in either base, may not include
leading zeros.)
*/

var _ = require('underscore');

var asDigit = function(n) {
  return [].map.apply(String(n), [function(x) {
    return Number(x);
  }]);
};

var isPalindromic = function(n) {
  var d = asDigit(n);
  return d.join() === d.reverse().join();
};

console.log(_.range(1e6).filter(function(x) {
  return isPalindromic(x) && isPalindromic(x.toString(2));
}).reduce(function(x, y) {
  return x + y;
}));


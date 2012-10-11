/*
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
*/

var bigint = require('bigint');

var factorial = function(n) {
  if (n < 2) {
    return 1;
  }
  else {
    var res = bigint(1);
    for (var i=1; i<=n; i++) {
      res = res.mul(i);
    }
  }
  return res;
}

var digits = function(n) {
  return n.toString().split('').map(Number);
}

var sum = function(xs) {
  return xs.reduce(function(x, y) {
    return x + y;
  })
}

console.log(sum(digits(factorial(100))));


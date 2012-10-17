/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

var _ = require('underscore');

function factorize(n) {
  return (function(n, c, res) {
    if (c > n) {
      return res;
    }
    else {
      if (n % c) {
        return arguments.callee(n, c+1, res);
      }
      else {
        return arguments.callee(n/c, c, res.concat([c]));
      }
    }
  })(n, 2, []);
}

console.log(_.last(factorize(600851475143)));


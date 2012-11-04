/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

var _ = require('underscore');

var factorize = function(n) {
  return (function loop(n, c, res) {
    return n < c ? res : n % c ? loop(n, c + 1, res) : loop(n / c, c, res.concat([c]));
  }(n, 2, []));
};

console.log(_.last(factorize(600851475143)));


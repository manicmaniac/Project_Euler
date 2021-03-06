/*
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
*/

var _ = require('underscore');

var gcd = function(m, n) {
  return n ? gcd(n ,m % n) : m;
};

var lcm = function(m, n) {
	return m * n / gcd(m, n);
};

console.log(_.range(1, 21).reduce(lcm));


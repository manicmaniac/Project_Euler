/*
Starting in the top left corner of a 2×2 grid, there are 6 routes (without
backtracking) to the bottom right corner.

[p_015]

How many routes are there through a 20×20 grid?
*/

var _ = require('underscore');

var c = function(n, r) {
  return _.range(r + 1, n + 1).reduce(function(x, y) {
    return x * y;
  }) / _.range(1, r + 1).reduce(function(x, y) {
    return x * y;
  });
};

console.log(c(40, 20));


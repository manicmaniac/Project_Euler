/*
Starting in the top left corner of a 2×2 grid, there are 6 routes (without
backtracking) to the bottom right corner.

[p_015]

How many routes are there through a 20×20 grid?
*/

function factorial(n) {
  var res = 1;
  for(var i=2; i<=n; i++) {
    res *= i;
  }
  return res;
}

function c(a, b) {
  var res = 1;
  for(var i=a; i>b; i--) {
    res *= i;
  }
  return Math.floor(res / factorial(b));
}

console.log(c(40, 20));

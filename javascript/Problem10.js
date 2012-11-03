/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

var sieve = function(n) {
  var sx = [], i;
  if (n % 2 === 0) {
    n --;
  }
  for (i=3; i<n; i+=2) {
    sx[sx.length] = i;
  }
  var px = [2];
  var conditional = function(x) {
    return x % px[px.length - 1] !== 0;
  };
  while (sx[sx.length - 1] > Math.pow(px[px.length - 1], 2)) {
    px[px.length] = sx.shift();
    sx = sx.filter(conditional);
  }
  return px.concat(sx);
};

console.log((sieve(2e6)).reduce(function(x, y) {
  return x + y;
}));


/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

function sum(xs) {return xs.reduce(function(x, y) {return x + y;});}

function sieve(n) {
  var sx = [];
  if (n % 2 == 0) {n--;}
  for (var i=3; i<n; i+=2) {
    sx[sx.length] = i;
  }
  var px = [2];
  while (sx[sx.length-1] > Math.pow(px[px.length-1], 2)) {
    px[px.length] = sx.shift();
    sx = sx.filter(function(x) {return x % px[px.length-1] != 0;});
  }
  return px.concat(sx);
}

console.log(sum(sieve(2000000)));


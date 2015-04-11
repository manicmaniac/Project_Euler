/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

function sieve(limit) {
  if (limit < 2) {
    return [];
  }

  var UNKNOWN  = 0,
      NONPRIME = 1;

  var search = new Uint8Array(limit);

  search[0] = NONPRIME;
  search[1] = NONPRIME;

  var sqrt_limit = Math.sqrt(limit);
  for (var current=2; current<=sqrt_limit; current++) {
    for (var i=current*2; i<limit; i+=current) {
      search[i] = NONPRIME;
    }
  }

  var res = [];
  for (i=0; i<limit; i++) {
    if (search[i] === UNKNOWN) {
      res.push(i);
    }
  }
  return res;
}

console.log((sieve(2e6)).reduce(function(x, y) {
  return x + y;
}));


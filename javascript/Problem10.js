/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

function sieve(limit) {
  var search = new Uint8Array(limit);
  var result = [];

  search[0] = 1;
  search[1] = 1;

  for (var i = 2; i < limit; i++) {
    if (!search[i]) {
      result.push(i);
      for (var j = i * i; j < limit; j += i) {
        search[j] = 1;
      }
    }
  }
  return result;
}

function sum(xs) {
  if (xs.length < 1) {
    return 0;
  }
  return xs.reduce(function(x, y) {
    return x + y;
  });
}

console.log(sum(sieve(2e6)));

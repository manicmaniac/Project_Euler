/*
The number, 197, is called a circular prime because all rotations of the
digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
73, 79, and 97.

How many circular primes are there below one million?
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

function digits(n) {
  return n.toString().split('').map(Number);
}

function circular(n) {
  var res = [];
  var d = digits(n);
  for (var i = 0; i < d.length; i++) {
    res.push(Number(d.join('')))
    d.push(d.shift());
  }
  return res;
}

function isOdd(n) {
  return n & 1;
}

var candidates = sieve(1e6).filter(function (x) {
  if (x == 2) {
    return true;
  }
  return digits(x).every(isOdd);
});
var answer = candidates.filter(function(x) {
  return circular(x).every(function(y) {
    return candidates.indexOf(y) > -1;
  });
}).length;
console.log(answer);


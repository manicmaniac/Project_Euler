/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

/**
 * find the greatest common divisor amongst `x` and `y`.
 * each of the arguments must be a natural number.
 */
function gcd(x, y) {
  return y ? gcd(y, x % y) : x;
}

/**
 * pseudorandom number generator (known as Linear Congruential Generator).
 */
function lcg(c, n, x) {
  return (x * x + c) % n;
}

/**
 * find the smallest divisor of the integer `n` with Trial Division method.
 * returns -1 if it is a prime.
 */
function trialDivision(n) {
  if (n > 2) {
    var limit = Math.sqrt(n) + 1;
    for (var i = 2; i < limit; i++) {
      if (n % i === 0) {
        return i;
      }
    }
  }
  return -1;
}

/**
 * find the one of divisors of the integer `n` with Pollard's Rho method.
 * returns -1 if it is a probable prime.
 * warning: less reliable for small numbers.
 */
function pollardsRho(n) {
  var x = 2;
  var y = 2;
  var c = 1;
  var d = 1;
  // partial application
  var f = lcg.bind(null, c, n);
  while (d === 1 && n) {
    x = f(x);
    y = f(f(y));
    d = gcd(Math.abs(x - y), n);
    if (d === n) {
      return -1;
    }
  }
  return d;
}

/**
 * a wrapper function to memoize a expensive function.
 */
function memoize(func, context) {
  var cache = {};
  return function(/* args ... */) {
    var args = Array.prototype.slice.call(arguments);
    return cache[args] ? cache[args] : cache[args] = func.apply(context, args);
  }
}

/**
 * factorize the integer `n`.
 * returns an array of prime factors.
 */
function factor(n) {
  // fallbacks to trial division for a small integer
  var divisor = (n < 100) ? trialDivision(n) : pollardsRho(n);
  if (divisor === -1) {
    return [n];
  }
  return factor(n / divisor).concat(factor(divisor));
}
// memoize results
factor = memoize(factor);


// main entry point
console.log(Math.max.apply(null, factor(600851475143)));


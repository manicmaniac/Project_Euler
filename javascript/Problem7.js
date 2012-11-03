/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

var isPrime = function(n) {
  if (n === 2) {
    return true;
  }
  if (n < 2 || n % 2 === 0) {
    return false;
  }
  var i;
  for (i=3; i<=Math.sqrt(n); i+=2) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
};

console.log((function() {
  var count = 0, i = 0;
  while (count < 1e4 + 1) {
    i ++;
    if (isPrime(i)) {
      count ++;
    }
  }
  return i;
}()));


/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

function isPrime(n) {
  for (i=2; i<Math.sqrt(n)+1; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

function countPrimes(n) {
  if (n < 3) {
    return 2
  }
  var cnt = 2
  for (var i=3;; i+=2) {
    if (isPrime(i)) {
      if (cnt == n) {
        return i
      }
      else {
        cnt += 1
      }
    }
  }
}

console.log(countPrimes(10001))

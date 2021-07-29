/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

function isPrime(n) {
  if (n === 2) {
    return true
  }
  if (n < 2 || n % 2 === 0) {
    return false
  }
  const limit = n ** 0.5
  for (let i = 3; i <= limit; i += 2) {
    if (n % i === 0) {
      return false
    }
  }
  return true
}

let i = 2
for (let count = 0;; i++) {
  if (isPrime(i)) {
    count++
  }
  if (count > 10000) {
    break
  }
}
console.log(i)

/*
 * The number 3797 has an interesting property. Being prime itself, it is possible
 * to continuously remove digits from left to right, and remain prime at each
 * stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797,
 * 379, 37, and 3.
 * 
 * Find the sum of the only eleven primes that are both truncatable from left to
 * right and right to left.
 * 
 * NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
 */

function isPrime(n) {
	if (n < 2) {
		return false
	}
	if (n === 2) {
		return true
	}
  const limit = n ** 0.5
  for (let i = 2; i <= limit; i++) {
    if (n % i === 0) {
      return false
    }
  }
  return true
}

function trunc(n) {
  const digits = Array.from(String(n), Number)
  const ltor = Array
    .from({ length: digits.length - 1 }, (_, i) => i + 1)
    .map(x => digits.slice(0, x))
	digits.reverse()
	const rtol = Array
    .from({ length: digits.length - 1 }, (_, i) => i + 1)
    .map(x => digits.slice(0, x).reverse(false))
	return ltor
    .concat(rtol)
    .map(x => Number(x.join('')))
}

const result = []
for (let i = 9; result.length < 11; i += 2) {
  if (isPrime(i) && trunc(i).every(isPrime)) {
    result.push(i)
  }
}
const answer = result.reduce((x, y) => x + y)
console.log(answer)

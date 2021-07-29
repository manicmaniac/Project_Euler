/*
 * The fraction ^49/[98] is a curious fraction, as an inexperienced mathematician
 * in attempting to simplify it may incorrectly believe that ^49/[98] = ^4/[8],
 * which is correct, is obtained by cancelling the 9s.
 * 
 * We shall consider fractions like, ^30/[50] = ^3/[5], to be trivial examples.
 * 
 * There are exactly four non-trivial examples of this type of fraction, less than
 * one in value, and containing two digits in the numerator and denominator.
 * 
 * If the product of these four fractions is given in its lowest common terms,
 * find the value of the denominator.
 */

function gcd(x, y) {
	return x < y ? gcd(y, x) : y === 0 ? x : gcd(y, x % y)
}

const result = []
const numbers = Array.from(Array(9), (_, i) => i + 1)
for (const i of numbers) {
  for (const j of numbers) {
    for (const k of numbers) {
      const n = Number(`${i}${j}`)
      const d = Number(`${j}${k}`)
      if (n < d && n / d === i / k) {
        result.push([n, d])
      }
    }
  }
}
const [a, b] = result.reduce(([x0, x1], [y0, y1]) => [x0 * y0, x1 * y1])
const answer = Math.max(a, b) / gcd(a, b)
console.log(answer)

/*
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
*/

function factorial(x) {
  return x < 2n ? 1n : factorial(x - 1n) * x
}

const answer = Array
  .from(String(factorial(100n)), Number)
  .reduce((x, y) => x + y)
console.log(answer)

/*
 * 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 * 
 * Find the sum of all numbers which are equal to the sum of the factorial of
 * their digits.
 * 
 * Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 */

function factorial(x) {
  return x < 2 ? 1 : x * factorial(x - 1)
}

function isCurious(x) {
  return x === Array
    .from(String(x), factorial)
    .reduce((x, y) => x + y)
}

const answer = Array
  .from({ length: factorial(9) * 7 - 3 }, (_, i) => i + 3)
  .filter(isCurious)
  .reduce((x, y) => x + y)
console.log(answer)

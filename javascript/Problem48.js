/*
 * The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 * 
 * Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 */

const answer = Array
  .from({ length: 1000 }, (_, i) => BigInt(i + 1))
  .reduce((sum, x) => sum + x ** x)
  .toString()
  .substr(-10, 10)
console.log(answer)

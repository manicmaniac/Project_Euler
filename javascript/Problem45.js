/*
 * Triangle, pentagonal, and hexagonal numbers are generated by the following
 * formulae:
 * 
 * Triangle     T[n]=n(n+1)/2    1, 3, 6, 10, 15, ...
 * Pentagonal   P[n]=n(3n−1)/2   1, 5, 12, 22, 35, ...
 * Hexagonal    H[n]=n(2n−1)     1, 6, 15, 28, 45, ...
 * 
 * It can be verified that T[285] = P[165] = H[143] = 40755.
 * 
 * Find the next triangle number that is also pentagonal and hexagonal.
 */

function *generateHexagonals(i = 0) {
  while (++i) {
    yield i * (2 * i - 1)
  }
}

function isTriangle(x) {
  return (((8 * x + 1) ** 0.5 - 1) / 2) % 1 === 0
}

function isPentagonal(x) {
  return (((24 * x + 1) ** 0.5 + 1) / 6) % 1 === 0
}

let answer
for (const x of generateHexagonals(1)) {
  if (isTriangle(x) && isPentagonal(x) && x !== 40755) {
    answer = x
    break
  }
}
console.log(answer)

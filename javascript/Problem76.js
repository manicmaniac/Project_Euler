/*
 * It is possible to write five as a sum in exactly six different ways:
 * 
 * 4 + 1
 * 3 + 2
 * 3 + 1 + 1
 * 2 + 2 + 1
 * 2 + 1 + 1 + 1
 * 1 + 1 + 1 + 1 + 1
 * 
 * How many different ways can one hundred be written as a sum of at least two
 * positive integers?
 */

function npartitions(n) {
  const cache = new Uint32Array(n + 1)
  cache[0] = 1
  for (let i = 1; i <= n; i++) {
    for (let j = i; j <= n; j++) {
      cache[j] += cache[j - i]
    }
  }
  return cache[n]
}

console.log(npartitions(100))

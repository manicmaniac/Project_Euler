/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * 
 * Find the sum of all the primes below two million.
 */

function sieve(limit) {
  const search = new Uint8Array(limit)
  const result = []
  search[0, 1] = [1, 1]
  for (let i = 2; i < limit; i++) {
    if (!search[i]) {
      result.push(i)
      for (let j = i * i; j < limit; j += i) {
        search[j] = 1
      }
    }
  }
  return result
}

const answer = sieve(2e6).reduce((x, y) => x + y)
console.log(answer)

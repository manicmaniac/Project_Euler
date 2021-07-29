/*
 * The number, 197, is called a circular prime because all rotations of the
 * digits: 197, 971, and 719, are themselves prime.
 * 
 * There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
 * 73, 79, and 97.
 * 
 * How many circular primes are there below one million?
 */

function sieve(limit) {
  if (limit < 2) {
    return []
  }

  const UNKNOWN  = 0
  const NONPRIME = 1

  const search = new Uint8Array(limit)

  search[0] = NONPRIME
  search[1] = NONPRIME

  const sqrtLimit = limit ** 0.5
  for (let current = 2; current <= sqrtLimit; current++) {
    for (let i = current * 2; i < limit; i += current) {
      search[i] = NONPRIME
    }
  }

  const result = []
  for (let i = 0; i < limit; i++) {
    if (search[i] === UNKNOWN) {
      result.push(i)
    }
  }
  return result
}

function digits(x) {
  return Array.from(String(x), Number)
}

function circular(n) {
  const result = []
  const d = digits(n)
  for (let i = 0; i < d.length; i++) {
    result.push(Number(d.join('')))
    d.push(d.shift())
  }
  return result
}

const candidates = sieve(1e6).filter(x => x === 2 || digits(x).every(x => x & 1))
const answer = candidates
  .filter(x => circular(x).every(y => candidates.includes(y)))
  .length
console.log(answer)

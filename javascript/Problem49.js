/*
 * The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
 * by 3330, is unusual in two ways: (i) each of the three terms are prime, and,
 * (ii) each of the 4-digit numbers are permutations of one another.
 * 
 * There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
 * exhibiting this property, but there is one other 4-digit increasing sequence.
 * 
 * What 12-digit number do you form by concatenating the three terms in this
 * sequence?
 */

function isPermutations(xs) {
  return new Set(xs.map(x => String(x).split('').sort().join(''))).size === 1
}

function sieve(limit) {
  const primes = []
  let search = Array.from({ length: limit - 2 }, (_, i) => i + 2)
  while (true) {
    const current = search[0]
    primes.push(current)
    search = search.filter(x => x % current !== 0)
    if (primes[primes.length - 1] ** 2 > search[search.length - 1]) {
      return primes.concat(search)
    }
  }
}

function isPrime(x) {
  if (x < 2) {
    return false
  }
  if (x === 2) {
    return true
  }
  const limit = x ** 0.5
  for (let i = 2; i <= limit; i++) {
    if (x % i === 0) {
      return false
    }
  }
  return true
}

const MAX = Math.ceil(10000 / 3)
const MIN = 1000

const res = []
for (const prime of sieve(MAX)) {
  if (prime > MIN) {
    for (let margin = MIN; margin < MAX; margin += 2) {
      const b = prime + margin
      const c = prime + margin * 2
      if ([b, c].every(isPrime)) {
        res.push([prime, b, c])
      }
    }
  }
}
const sequences = res
console.log(sequences.filter(isPermutations)[1].join(''))

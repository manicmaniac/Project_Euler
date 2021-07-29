/*
 * The following iterative sequence is defined for the set of positive integers:
 * 
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 * 
 * Using the rule above and starting with 13, we generate the following sequence:
 * 
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 * 
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains
 * 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
 * that all starting numbers finish at 1.
 * 
 * Which starting number, under one million, produces the longest chain?
 * 
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 */

function findLongestCollatz(limit) {
  const cache = new Uint16Array(limit)
  let longest = [0, 0]
  for (let start = 1; start < limit; start += 2) {
    let length = 1
    for (let i = start; i > 1; length++) {
      i = (i & 1 ? 3 * i + 1 : i / 2)
      if (cache[i]) {
        length += cache[i]
        break
      }
    }
    if (longest[1] < length) {
      longest = [start, length]
    }
    cache[start] = length
  }
  return longest[0]
}

console.log(findLongestCollatz(1e6))

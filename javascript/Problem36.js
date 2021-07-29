/*
 * The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.
 * 
 * Find the sum of all numbers, less than one million, which are palindromic in
 * base 10 and base 2.
 * 
 * (Please note that the palindromic number, in either base, may not include
 * leading zeros.)
 */

function isPalindromic(x) {
  const s = String(x)
  return s === Array.from(s).reverse().join('')
}

const answer = [...Array(1e6).keys()]
  .filter(x => isPalindromic(x) && isPalindromic(x.toString(2)))
  .reduce((x, y) => x + y)
console.log(answer)

/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

const MAX = 999
const MIN = 100

function createPalindromic(x) {
  const s = String(x);
  return Number(s + Array.from(s, Number).reverse().join(''))
}

function isProductOf3DigitsNumbers(x) {
  const limit = x ** 0.5
  for (let i = 100; i < limit; i++) {
    if (x % i === 0 && x / i < 1000) {
      return true;
    }
  }
  return false;
}

for (let i = MAX; i > MIN; i--) {
  const palindrome = createPalindromic(i);
  if (isProductOf3DigitsNumbers(palindrome)) {
    console.log(palindrome);
    break;
  }
}

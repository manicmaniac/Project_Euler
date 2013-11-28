/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

var MAX = 999,
    MIN = 100;

function createPalindromic(n) {
  var str = String(n);
  return Number(str + str.split('').reverse().join(''));
}

function isProductOf3DigitsNumbers(n) {
  var limit = Math.sqrt(n),
      i;
  for (i=100; i<limit; i++) {
    if (n % i === 0 && n / i < 1e3) {
      return true;
    }
  }
  return false;
}

for (var i=MAX; i>MIN; i--) {
  var palindrome = createPalindromic(i);
  if (isProductOf3DigitsNumbers(palindrome)) {
    console.log(palindrome);
    break;
  }
}


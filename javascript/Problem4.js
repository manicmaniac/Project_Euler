/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

function isPalidromic(n) {
  str = String(n);
  return str == str.split("").reverse().join("");
}

function findMaxPalindromic(digits) {
  res = 0;
  start = Math.pow(10, (digits - 1));
  end = Math.pow(10, (digits));
  for (var i=start; i<end; i++) {
    for (var j=start; j<end; j++) {
      if (isPalidromic(i * j) && res < i * j) {
        res = i * j;
      }
    }
  }
  return res;
}

console.log(findMaxPalindromic(3));

/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

var isPalindromic = function(n) {
  str = String(n);
  return str === str.split("").reverse().join("");
};

var findMaxPalindromic = function(digits) {
  var res = 0, i, j;
  var start = Math.pow(10, (digits - 1));
  var end = Math.pow(10, (digits));
  for (i=start; i<end; i++) {
    for (j=start; j<end; j++) {
      if (isPalindromic(i * j) && res < i * j) {
        res = i * j;
      }
    }
  }
  return res;
};

console.log(findMaxPalindromic(3));


/*
The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in
base 10 and base 2.

(Please note that the palindromic number, in either base, may not include
leading zeros.)
*/

function asDigit(n) {
  var s = n.toString();
  var res = [];
  for (var i=0; i<s.length; i++) {
    res[i] = s.slice(i, i+1) * 1;
  }
  return res;
}

function isPalindromic(n) {
  var d = asDigit(n);
  return d.join() == d.reverse().join();
}

function sum(xs) {
  return xs.reduce(function(x, y) {return x+y});
}

var lst = [];
for (var i=1; i<1000000; i++) {
  lst[i] = i;
}

console.log(sum(lst.filter(function(x) {return isPalindromic(x) && isPalindromic(x.toString(2))})));

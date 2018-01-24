/*
 * The Fibonacci sequence is defined by the recurrence relation:
 *
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 *
 * It turns out that F[541], which contains 113 digits, is the first Fibonacci
 * number for which the last nine digits are 1-9 pandigital (contain all the
 * digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
 * digits, is the first Fibonacci number for which the first nine digits are 1-9
 * pandigital.
 *
 * Given that F[k] is the first Fibonacci number for which the first nine digits
 * AND the last nine digits are 1-9 pandigital, find k.
 */
var LOG10_PHI = Math.log10((1 + Math.sqrt(5)) / 2);
var LOG10_SQRT5 = Math.log10(5) / 2;

function upperDigitsOfFibonacciAt(n) {
  var l = LOG10_PHI * (n + 1) - LOG10_SQRT5;
  return Math.round(1e8 * Math.pow(10, (l - Math.trunc(l))));
}

function generateLowerDigitsOfFibonaccis(callback) {
  var i = 0;
  var j = 1;
  while (true) {
    var k = i;
    i = j;
    j = (j + k) % 1e10;
    if (callback(i)) {
      break;
    }
  }
}

function isPandigital(x) {
  if (x % 9) {
    return false;
  }
  var flags = 0b0000000001;
  while (x) {
    var d = x % 10;
    x /= 10;
    flags |= 1 << d;
  }
  return flags == 0b1111111111
}

var i = 0;
generateLowerDigitsOfFibonaccis(function(lowerDigits) {
  if (isPandigital(lowerDigits) && isPandigital(upperDigitsOfFibonacciAt(i))) {
    return true;
  }
  i++;
});
console.log(i + 1);

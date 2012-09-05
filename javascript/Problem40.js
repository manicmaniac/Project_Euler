/*
An irrational decimal fraction is created by concatenating the positive
integers:

0.123456789101112131415161718192021...

It can be seen that the 12^th digit of the fractional part is 1.

If d[n] represents the n^th digit of the fractional part, find the value of the
following expression.

d[1] × d[10] × d[100] × d[1000] × d[10000] × d[100000] × d[1000000]
*/

function d(n) {
  var res = '';
  for (var i=0; res.length <= n; i++) {
    res = res + i.toString();
  }
  return res[n];
}

console.log(d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000));


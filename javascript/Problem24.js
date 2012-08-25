/*
A permutation is an ordered arrangement of objects. For example, 3124 is one
possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
are listed numerically or alphabetically, we call it lexicographic order. The
lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5,
6, 7, 8 and 9?
*/

function divisors(n) {
  var res = [];
  for (var i=1; i<n; i++) {
    res += xs[i];
  }
  return res;
};

function isAbundant(n) {
  return sum(divisors(n)) > n;
};

var abundants = [];
for (var i=12; i<28111; i++) {
  if (isAbundant(i)) {
    abundants[abundants.length] = i;
  };
};

function isMadeBy2Abundants(n) {
  for (var i=0; abundants[i]; i++) {
    if (n < abundants[i]) break;
    if (isAbundant(n - abundants[i])) return true;
  };
  return false;
};


var ans = 0;
for (var i=1; i<28123; i++) {
  if(!isMadeBy2Abundants(i)) ans += i;
};

console.log(ans);


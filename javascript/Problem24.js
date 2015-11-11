/*
A permutation is an ordered arrangement of objects. For example, 3124 is one
possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
are listed numerically or alphabetically, we call it lexicographic order. The
lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5,
6, 7, 8 and 9?
*/

function factorial(x) {
  for (var acc = 1; x > 0; x--) {
    acc *= x;
  }
  return acc;
}

function permutationAt(xs, n) {
  if (xs.length < 2) {
    return xs;
  }
  var m = factorial(xs.length - 1);
  var index = Math.floor(n / m);
  var ys = xs.slice(0, index).concat(xs.slice(index + 1));
  return [xs[index]].concat(permutationAt(ys, n - m * index));
}

console.log(permutationAt([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 999999).join(''));

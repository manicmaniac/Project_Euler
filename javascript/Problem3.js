/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

function factorize(n, c, res) {
  if (typeof c === 'undefined') {c = 2;}
  if (typeof res === 'undefined') {res = [];}
  if (c > n) {
    return res;
  }
  else {
    if (n % c === 0) {
      res.push(c);
      return factorize(n/c, c, res);
    }
    else {
      return factorize(n, c+1, res);
    }
  }
}

l = factorize(600851475143);
console.log(l[l.length - 1]);

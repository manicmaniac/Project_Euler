/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

function factorize(n) {
  var res = {};
  while (n % 2 === 0) {
    res[2] = (res[2] || 0) + 1;
    n /= 2;
  }

  var d = 3;
  while (n >= d) {
    if (n % d) {
      d += 2;
    } else {
      res[d] = (res[d] || 0) + 1;
      n /= d;
    }
  }
  return res;
}

console.log(Math.max.apply(null, Object.keys(factorize(600851475143))));


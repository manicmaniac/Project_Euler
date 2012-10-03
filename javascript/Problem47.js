/*
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct primes factors.
What is the first of these numbers?
*/

function factorize(n) {
  var res = [];
  var d = 2;
  while (n >= d) {
    if (n % d == 0) {
      res.push(d);
      n /= d;
    }
    else d++;
  }
  return res;
}

function uniq(arr) {
  var map = {};
  var res = [];
  var value
  for (var i=0; i<arr.length; i++) {
    value = arr[i]
    if (!(value in map)) {
      map[value] = true;
      res.push(value);
    }
  }
  return res;
}

function isConditional(n) {
  return (uniq(factorize(n)).length == 4);
}

//main
for (var i=0;
	    !(isConditional(i) &&
	    isConditional(i+1) &&
	    isConditional(i+2) &&
	    isConditional(i+3)
	    );
	    i++
    ) {}
console.log(i);


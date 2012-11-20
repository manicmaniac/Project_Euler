/*
The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
number, 134217728=8^9, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
*/

console.log((function() {
  var ans = 0, i, j;
  for (i=1; i<10; i++) {
    for (j=1; j<22; j++) {
      if (String(Math.pow(i, j)).length === j) {
        ans++;
      }
    }
  }
  return ans;
}()));


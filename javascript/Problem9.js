/*
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 * 
 * a^2 + b^2 = c^2
 * 
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 * 
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */

let m, n
for (m = 1, n = 1; m * (m + n) !== 500; n++) {
  if (m < n) {
    m++
    n = 1
  }
}
const answer = (m ** 4 - n ** 4) * 2 * m * n
console.log(answer)

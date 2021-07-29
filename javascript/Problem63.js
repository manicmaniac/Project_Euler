/*
 * The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
 * number, 134217728=8^9, is a ninth power.
 * 
 * How many n-digit positive integers exist which are also an nth power?
 */

let answer = 0
for (let i = 1; i < 10; i++) {
  for (let j = 1; j < 22; j++) {
    if (Math.floor(Math.log10(i) * j + 1) === j) {
      answer++
    }
  }
}
console.log(answer)

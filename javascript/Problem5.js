/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 * 
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */

function gcd(m, n) {
  return n ? gcd(n ,m % n) : m
}

function lcm(m, n) {
	return m * n / gcd(m, n)
}

const answer = Array.from(Array(20), (_, x) => x + 1).reduce(lcm)
console.log(answer)

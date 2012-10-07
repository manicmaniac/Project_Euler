###
If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
###

console.log([1..999].filter((n) -> !(n % 3 * n % 5)).reduce((s, t) -> s + t))


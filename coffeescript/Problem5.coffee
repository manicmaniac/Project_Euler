###
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
###

Bigint = require('bigint')

console.log [1..20].reduce (x, y) -> x * y / (Bigint x).gcd Bigint y


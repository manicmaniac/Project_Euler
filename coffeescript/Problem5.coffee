###
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
###

gcd = (x, y) -> x and gcd(y, x % y) or y
lcm = (x, y) -> x * y / gcd x, y

console.log [1..20].reduce lcm


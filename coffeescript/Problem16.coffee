###
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
###

Bigint = require('bigint')

console.log (Number i for i in String (Bigint 2).pow(1e3)).reduce((x, y) -> x + y)


###
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
###

Bigint = require('bigint')

console.log [1..1e3].reduce((x, y) -> String (Bigint x).add((Bigint y).pow y)).substr -10, 10


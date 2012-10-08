###
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
###

bigint = require('bigint')

console.log([1..1000].reduce((x, y) -> bigint(x).add(bigint(y).pow(y))).toString().substr(-10, 10))


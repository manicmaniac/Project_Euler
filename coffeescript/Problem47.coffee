###
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct primes factors.
What is the first of these numbers?
###

_ = require('underscore')

count = do (n=0) -> -> ++ n

factorize = (n) ->
    [d, res] = [2, []]
    while n >= d
        unless n % d
            res.push d
            n /= d
        else
            d++
    res

distinctFactors = (n) -> _.uniq(factorize n, true).length

i = 0
while true
    i++
    if [i...i+4].every((x) -> distinctFactors(x) == 4)
        console.log i
        break


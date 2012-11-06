###
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
also prime.

What is the largest n-digit pandigital prime that exists?
###

permutations = require('itertools').permutationsSync
_ = require('underscore')

isPrime = (n) -> not (n - 2) or [2..Math.sqrt n].every (x) -> n % x

candidatesFrom = (arr) -> (permutations(arr).filter (x) -> _.last(x) % 2).map (y) -> y.join('')

console.log _(candidatesFrom [1..i] for i in [1..9] when isPrime i).chain().flatten().max().value()


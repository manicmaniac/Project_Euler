###
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of
their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
###

factorial = (n) -> if n > 1 then [1..n].reduce((x, y) -> x * y) else 1

factorial[0..9] = [0..9].map(factorial)

is_curious = (n) ->
	(factorial[Number(i)] for i in n.toString()).reduce((x, y) -> x + y) == n

console.log([3..(factorial[9] * 7)].filter(is_curious).reduce((x, y) -> x + y))


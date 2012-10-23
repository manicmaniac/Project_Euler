###
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of
their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
###

factorial = [0..9].map((n) -> if n < 2 then 1 else arguments.callee(n - 1) * n)

isCurious = (n) -> (factorial[i] for i in String n).reduce((x, y) -> x + y) == n

console.log [3..factorial[9]*7].filter(isCurious).reduce((x, y) -> x + y)


###
It can be seen that the number, 125874, and its double, 251748, contain exactly
the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
contain the same digits.
###

digits = (n) -> Number i for i in String n

hasSameDigits = (n, count) ->
	arr = []
	[1..count].map((x) -> String digits(x * n).sort()).reduce((x, y) -> if x == y then x)

i = 1
i++ until hasSameDigits(i, 6)
console.log i


###
The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in
base 10 and base 2.

(Please note that the palindromic number, in either base, may not include
leading zeros.)
###

is_palindromic = (n) ->
	d= (Number(i) for i in String(n))
	d.join()== d.reverse().join()

console.log(([1..1e6].filter((x) -> is_palindromic(x) and is_palindromic(x.toString(2)))).reduce((x, y) -> x + y))


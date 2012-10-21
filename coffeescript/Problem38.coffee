###
Take the number 192 and multiply it by each of 1, 2, and 3:

    192 × 1 = 192
    192 × 2 = 384
    192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576. We will
call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and
5, giving the pandigital, 918273645, which is the concatenated product of 9 and
(1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?
###

_ = require('underscore')

isPandigital = (n) -> (char for char in (String n)).sort().join('') == '123456789'

concatProduct = (n) ->
	((n, i, res) ->
		len = (String res).length
		if len == 9
			return Number res
		else if len > 9
			return 0
		else
			arguments.callee(n, i + 1, ((String res) + (String (n * i))))
	)(n, 1, '')

console.log _.max([1..9876].map(concatProduct).filter(isPandigital))


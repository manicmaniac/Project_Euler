###
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
each of the digits 0 to 9 in some order, but it also has a rather interesting
sub-string divisibility property.

Let d[1] be the 1^st digit, d[2] be the 2^nd digit, and so on. In this way, we
note the following:

  • d[2]d[3]d[4]=406 is divisible by 2
  • d[3]d[4]d[5]=063 is divisible by 3
  • d[4]d[5]d[6]=635 is divisible by 5
  • d[5]d[6]d[7]=357 is divisible by 7
  • d[6]d[7]d[8]=572 is divisible by 11
  • d[7]d[8]d[9]=728 is divisible by 13
  • d[8]d[9]d[10]=289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.
###

isPandigital = (n) -> String(n).split('').sort().join('') == '0123456789'

res = []
for d1 in [1..9]
	for d2 in [0..9]
		for d3 in [0..9]
			for d4 in [0..9]
				continue if (d2 * 100 + d3 * 10 + d4) % 2
				for d5 in [0..9]
					continue if (d3 * 100 + d4 * 10 + d5) % 3
					for d6 in [0..9]
						continue if (d4 * 100 + d5 * 10 + d6) % 5
						for d7 in [0..9]
							continue if (d5 * 100 + d6 * 10 + d7) % 7
							for d8 in [0..9]
								continue if (d6 * 100 + d7 * 10 + d8) % 11
								for d9 in [0..9]
									continue if (d7 * 100 + d8 * 10 + d9) % 13
									for d10 in [1..9]
										continue if (d8 * 100 + d9 * 10 + d10) % 17
										res.push Number [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10].join ''

console.log res.filter(isPandigital).reduce (x, y) -> (x + y)


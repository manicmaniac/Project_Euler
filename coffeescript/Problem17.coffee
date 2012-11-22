###
If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
letters. The use of "and" when writing out numbers is in compliance with
British usage.
###

dic =
	0: ''
	1: 'one'
	2: 'two'
	3: 'three'
	4: 'four'
	5: 'five'
	6: 'six'
	7: 'seven'
	8: 'eight'
	9: 'nine'
	10: 'ten'
	11: 'eleven'
	12: 'twelve'
	13: 'thirteen'
	14: 'fourteen'
	15: 'fifteen'
	16: 'sixteen'
	17: 'seventeen'
	18: 'eighteen'
	19: 'nineteen'
	20: 'twenty'
	30: 'thirty'
	40: 'forty'
	50: 'fifty'
	60: 'sixty'
	70: 'seventy'
	80: 'eighty'
	90: 'ninety'
	100: 'handred'
	1000: 'onethousand'

numToEn = (n) ->
	do rec = (n=n, res='') -> switch
		when !n
			res
		when n == 1e3
			dic[n]
		when n % 100 == 0
			res + dic[n / 100] + dic[100]
		when n <= 20
			res + dic[n]
		when 20 < n < 100
			rec n % 10, res + dic[n - n % 10]
		when n >= 100
			rec n % 100, res + dic[Math.floor n / 100] + dic[100] + 'and'

console.log [1..1e3].map(numToEn).join('').length


###
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
###

genPalindrome = (n) ->
	str = for i in String(n) then i
	rev = (for i in String(n) then i).reverse()
	Number(str.concat(rev).join(''))

productOf3Digits = (n) ->
	for i in [100..999]
		if n % i == 0 and 99 < n / i < 1000
			return true
	false

for i in [999..100]
	if productOf3Digits(genPalindrome(i))
		console.log(genPalindrome(i))
		break


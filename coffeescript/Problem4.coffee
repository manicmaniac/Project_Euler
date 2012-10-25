###
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
###

_ = require('underscore')

genPalindrome = (n) ->
	Number (x = (i for i in String n)).concat(x[..].reverse()).join ''

productOf3Digits = (n) ->
	[100..999].some (x) -> not (n % x) and 99 < n / x < 1000

console.log _([999..100].map genPalindrome).find productOf3Digits


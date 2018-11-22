/*
 * A palindromic number reads the same both ways. The largest palindrome made from
 * the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */
package main

import (
	"fmt"
	"math"
)

func MakePalindrome(x int) int {
	ndigits := int(math.Log10(float64(x))) + 1
	palindrome := x * int(math.Pow10(ndigits))
	for i := ndigits; x > 0; i-- {
		palindrome += (x % 10) * int(math.Pow10(i-1))
		x /= 10
	}
	return palindrome
}

func IsProductOfNdigits(x int, n int) bool {
	min := int(math.Pow10(n - 1))
	max := min*10 - 1
	for i := max; i >= min; i-- {
		if x%i == 0 {
			d := x / i
			return d >= min && d <= max
		}
	}
	return false
}

func main() {
	for i := 999; i > 100; i-- {
		palindrome := MakePalindrome(i)
		if IsProductOfNdigits(palindrome, 3) {
			fmt.Println(palindrome)
			break
		}
	}
}

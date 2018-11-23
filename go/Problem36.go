/*
 * The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.
 *
 * Find the sum of all numbers, less than one million, which are palindromic in
 * base 10 and base 2.
 *
 * (Please note that the palindromic number, in either base, may not include
 * leading zeros.)
 */
package main

import "fmt"

func IsBinaryPalindrome(x int) bool {
	if x%2 == 0 {
		return false
	}
	reversedX := 0
	temp := x
	for temp > 0 {
		reversedX <<= 1
		reversedX |= temp & 1
		temp >>= 1
	}
	return x == reversedX
}

func IsDecimalPalindrome(x int) bool {
	if x%10 == 0 {
		return false
	}
	reversedX := 0
	for y := x; y > 0; y /= 10 {
		reversedX *= 10
		reversedX += y % 10
	}
	return x == reversedX
}

func main() {
	result := 0
	for i := 0; i < 1000000; i++ {
		if IsDecimalPalindrome(i) && IsBinaryPalindrome(i) {
			result += i
		}
	}
	fmt.Println(result)
}

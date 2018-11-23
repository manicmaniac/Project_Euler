/*
 * Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
 *
 * 1634 = 14 + 64 + 34 + 44
 * 8208 = 84 + 24 + 04 + 84
 * 9474 = 94 + 44 + 74 + 44
 * As 1 = 14 is not a sum it is not included.
 *
 * The sum of these numbers is 1634 + 8208 + 9474 = 19316.
 *
 * Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
 */
package main

import (
	"fmt"
	"math"
)

func Digits(x int64) []int64 {
	ndigits := int(math.Log10(float64(x))) + 1
	digits := make([]int64, ndigits)
	for i := ndigits - 1; x > 0; i-- {
		digits[i] = x % 10
		x /= 10
	}
	return digits
}

func IsArmstrong5(x int64) bool {
	sum := int64(0)
	for _, value := range Digits(x) {
		sum += int64(math.Pow(float64(value), 5))
	}
	return x == sum
}

func main() {
	sum := int64(0)
	for i := int64(2); i < 6*int64(math.Pow(9, 5)); i++ {
		if IsArmstrong5(i) {
			sum += i
		}
	}
	fmt.Println(sum)
}

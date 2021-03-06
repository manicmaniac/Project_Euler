/*
 * 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 *
 * Find the sum of all numbers which are equal to the sum of the factorial of their digits.
 *
 * Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 */
package main

import "fmt"

var factorialsTo9 = []int{1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880}

func IsFactorion(x int) bool {
	result := 0
	y := x
	for y > 0 && result <= x {
		result += factorialsTo9[y%10]
		y /= 10
	}
	return x == result
}

func main() {
	result := 0
	for i := 3; i < 362880*7; i++ {
		if IsFactorion(i) {
			result += i
		}
	}
	fmt.Println(result)
}

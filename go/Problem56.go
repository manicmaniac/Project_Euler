/*
 * A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^
 * 100 is almost unimaginably large: one followed by two-hundred zeros. Despite
 * their size, the sum of the digits in each number is only 1.
 *
 * Considering natural numbers of the form, a^b, where a, b < 100, what is the
 * maximum digital sum?
 */
package main

import (
	"fmt"
	"math/big"
)

func main() {
	maxSum := 0
	for a := int64(2); a < 100; a++ {
		bigA := big.NewInt(a)
		for b := int64(2); b < 100; b++ {
			bigB := big.NewInt(b)
			bigB.Exp(bigB, bigA, nil)
			s := bigB.String()
			sum := 0
			for _, c := range s {
				sum += int(c - '0')
			}
			if maxSum < sum {
				maxSum = sum
			}
		}
	}
	fmt.Println(maxSum)
}

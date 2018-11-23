/*
 * A unit fraction contains 1 in the numerator. The decimal representation of the
 * unit fractions with denominators 2 to 10 are given:
 *
 *     ^1/[2]  =  0.5
 *     ^1/[3]  =  0.(3)
 *     ^1/[4]  =  0.25
 *     ^1/[5]  =  0.2
 *     ^1/[6]  =  0.1(6)
 *     ^1/[7]  =  0.(142857)
 *     ^1/[8]  =  0.125
 *     ^1/[9]  =  0.(1)
 *     ^1/[10] =  0.1
 *
 * Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
 * seen that ^1/[7] has a 6-digit recurring cycle.
 *
 * Find the value of d < 1000 for which ^1/[d] contains the longest recurring
 * cycle in its decimal fraction part.
 */
package main

import (
	"fmt"
	"math/big"
)

func CountRecurringCycleOfFraction(x int) int {
	if x%2 == 0 {
		return 0
	}
	big1 := big.NewInt(1)
	big10 := big.NewInt(10)
	bigX := big.NewInt(int64(x))
	for i := 1; i < x; i++ {
		bigI := big.NewInt(int64(i))
		if bigI.Exp(big10, bigI, bigX).Cmp(big1) == 0 {
			return i
		}
	}
	return 0
}

func main() {
	maxX := 0
	maxI := 0
	for i := 0; i < 1000; i++ {
		x := CountRecurringCycleOfFraction(i)
		if maxX < x {
			maxX = x
			maxI = i
		}
	}
	fmt.Println(maxI)
}

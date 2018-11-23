/*
 * It was proposed by Christian Goldbach that every odd composite number can be
 * written as the sum of a prime and twice a square.
 *
 * 9 = 7 + 2×1^2
 * 15 = 7 + 2×2^2
 * 21 = 3 + 2×3^2
 * 25 = 7 + 2×3^2
 * 27 = 19 + 2×2^2
 * 33 = 31 + 2×1^2
 *
 * It turns out that the conjecture was false.
 *
 * What is the smallest odd composite that cannot be written as the sum of a prime
 * and twice a square?
 */
package main

import (
	"fmt"
	"math"
	"math/big"
)

func IsTwiceOfSquare(x int) bool {
	if x%2 != 0 {
		return false
	}
	_, fractional := math.Modf(math.Sqrt(float64(x / 2)))
	return fractional == 0.0
}

func IsGoldbachComposite(x int) bool {
	for i := 0; i < x+1; i++ {
		if IsTwiceOfSquare(x - i) {
			bigI := big.NewInt(int64(i))
			if bigI.ProbablyPrime(10) {
				return true
			}
		}
	}
	return false
}

func main() {
	for i := 9; ; i += 2 {
		if !IsGoldbachComposite(i) {
			fmt.Println(i)
			break
		}
	}
}

/*
 * Euler discovered the remarkable quadratic formula:
 *
 * n² + n + 41
 *
 * It turns out that the formula will produce 40 primes for the consecutive values
 * n = 0 to 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is
 * divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible
 * by 41.
 *
 * The incredible formula  n² − 79n + 1601 was discovered, which produces 80
 * primes for the consecutive values n = 0 to 79. The product of the coefficients,
 * −79 and 1601, is −126479.
 *
 * Considering quadratics of the form:
 *
 *     n² + an + b, where |a| < 1000 and |b| < 1000
 *
 *     where |n| is the modulus/absolute value of n
 *     e.g. |11| = 11 and |−4| = 4
 *
 * Find the product of the coefficients, a and b, for the quadratic expression
 * that produces the maximum number of primes for consecutive values of n,
 * starting with n = 0.
 */
package main

import (
	"fmt"
	"math/big"
)

func CountQuadraticPrimes(a int, b int) (count int) {
	for i := 0; i < b; i++ {
		x := big.NewInt(int64(i*i + a*i + b))
		if x.ProbablyPrime(10) {
			count++
		} else {
			break
		}
	}
	return
}

func main() {
	longest := 0
	longestProduct := 0
	for a := -999; a < 1000; a += 2 {
		for b := 2; b < 1000; b++ {
			if big.NewInt(int64(b)).ProbablyPrime(10) {
				result := CountQuadraticPrimes(a, b)
				if longest < result {
					longest = result
					longestProduct = a * b
				}
			}
		}
	}
	fmt.Println(longestProduct)
}

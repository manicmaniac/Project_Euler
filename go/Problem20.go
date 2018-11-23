/*
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 *
 * For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 * and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
 *
 * Find the sum of the digits in the number 100!
 */
package main

import (
	"fmt"
	"math/big"
)

func Factorial(x *big.Int) *big.Int {
	i := new(big.Int)
	one := big.NewInt(1)
	for i.Set(x); i.Sign() > 0; i.Sub(i, one) {
		x.Mul(x, i)
	}
	return x
}

func main() {
	result := Factorial(big.NewInt(100))
	sum := 0
	for _, value := range result.String() {
		sum += int(value) - 48
	}
	fmt.Println(sum)
}

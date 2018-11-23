/*
 * 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 *
 * What is the sum of the digits of the number 2^1000?
 */
package main

import (
	"fmt"
	"math/big"
)

func main() {
	x := big.NewInt(2)
	x.Exp(x, big.NewInt(1000), nil)
	sum := 0
	for _, value := range x.String() {
		sum += int(value) - 48
	}
	fmt.Println(sum)
}

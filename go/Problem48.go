/*
 * The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 *
 * Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 */
package main

import (
	"fmt"
	"math/big"
)

func main() {
	sum := big.NewInt(0)
	limit := big.NewInt(10)
	limit.Exp(limit, big.NewInt(10), nil)
	for i := int64(1); i <= 1000; i++ {
		bigI := big.NewInt(i)
		bigI.Exp(bigI, bigI, limit)
		sum.Add(sum, bigI)
	}
	sum.Mod(sum, limit)
	fmt.Println(sum)
}

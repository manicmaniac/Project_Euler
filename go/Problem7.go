/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 *
 * What is the 10 001st prime number?
 */
package main

import (
	"fmt"
	"math"
)

func IsPrime(x int) bool {
	if x == 2 {
		return true
	}
	if x < 2 || x%2 == 0 {
		return false
	}
	sqrtX := math.Sqrt(float64(x))
	for i := 3; float64(i) <= sqrtX; i += 2 {
		if x%i == 0 {
			return false
		}
	}
	return true
}

func main() {
	i := 0
	for count := 0; count <= 10000; i++ {
		if IsPrime(i) {
			count++
		}
	}
	fmt.Println(i - 1)
}

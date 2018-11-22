/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */
package main

import (
	"fmt"
	"math"
)

func Sieve(array []bool) {
	array[0] = true
	array[1] = true
	limit := int(math.Sqrt(float64(len(array))))
	for i := 2; i <= limit; i++ {
		if !array[i] {
			for j := i * i; j < len(array); j += i {
				array[j] = true
			}
		}
	}
}

func main() {
	array := make([]bool, 2000000)
	Sieve(array)
	sum := 0
	for i := 0; i < len(array); i++ {
		if !array[i] {
			sum += i
		}
	}
	fmt.Println(sum)
}

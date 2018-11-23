/*
 * The number, 197, is called a circular prime because all rotations of the
 * digits: 197, 971, and 719, are themselves prime.
 *
 * There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
 * 73, 79, and 97.
 *
 * How many circular primes are there below one million?
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

func GenerateCirculars(x int, callback func(x int)) {
	ndigits := int(math.Log10(float64(x))) + 1
	for i := 0; i < ndigits; i++ {
		callback(x)
		x = (x%10)*int(math.Pow10(ndigits-1)) + x/10
	}
}

func main() {
	isComposites := make([]bool, 1000000)
	Sieve(isComposites)
	count := 0
	for i, isComposite := range isComposites {
		if !isComposite {
			isCircularPrime := true
			GenerateCirculars(i, func(x int) {
				if isComposites[x] {
					isCircularPrime = false
				}
			})
			if isCircularPrime {
				count++
			}
		}
	}
	fmt.Println(count)
}

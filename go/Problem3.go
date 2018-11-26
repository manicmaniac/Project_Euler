/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 */
package main

import "fmt"

func Factorize(x int64) (factors []int64) {
	for d := int64(2); x >= d; {
		if x%d == 0 {
			factors = append(factors, d)
			x /= d
		} else {
			d += 1
		}
	}
	return
}

func main() {
	factors := Factorize(600851475143)
	fmt.Println(factors[len(factors)-1])
}

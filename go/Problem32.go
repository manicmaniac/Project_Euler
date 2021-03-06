/*
 * We shall say that an n-digit number is pandigital if it makes use of all the
 * digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
 * through 5 pandigital.
 *
 * The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
 * multiplicand, multiplier, and product is 1 through 9 pandigital.
 *
 * Find the sum of all products whose multiplicand/multiplier/product identity can
 * be written as a 1 through 9 pandigital.
 *
 * HINT: Some products can be obtained in more than one way so be sure to only
 * include it once in your sum.
 */
package main

import "fmt"

func Permutations(xs []int, n int, callback func(xs []int)) {
	if n == 1 {
		callback(xs)
		return
	}
	for i := 0; i < n-1; i++ {
		Permutations(xs, n-1, callback)
		tmp := xs[n-1]
		if n%2 == 0 {
			xs[n-1] = xs[i]
			xs[i] = tmp
		} else {
			xs[n-1] = xs[0]
			xs[0] = tmp
		}
	}
	Permutations(xs, n-1, callback)
}

func ConcatenateDigits(digits []int, start int, stop int) (concatenated int) {
	for i := start; i < stop; i++ {
		concatenated *= 10
		concatenated += digits[i]
	}
	return
}

func main() {
	digits := []int{1, 2, 3, 4, 5, 6, 7, 8, 9}
	context := make([]bool, 9999)
	Permutations(digits, 9, func(digits []int) {
		product := ConcatenateDigits(digits, 5, 9)
		if !context[product] {
			multiplier := digits[0]
			multiplicand := ConcatenateDigits(digits, 1, 5)
			if multiplier*multiplicand == product {
				context[product] = true
			} else {
				multiplier = ConcatenateDigits(digits, 0, 2)
				multiplicand = ConcatenateDigits(digits, 2, 5)
				if multiplier*multiplicand == product {
					context[product] = true
				}
			}
		}
	})
	sum := 0
	for i := 0; i < 9999; i++ {
		if context[i] {
			sum += i
		}
	}
	fmt.Println(sum)
}

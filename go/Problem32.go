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

func Permutations(xs []int, n int, context interface{}, callback func(xs []int, context interface{})) {
	if n == 1 {
		callback(xs, context)
		return
	}
	for i := 0; i < n-1; i++ {
		Permutations(xs, n-1, context, callback)
		tmp := xs[n-1]
		if n%2 == 0 {
			xs[n-1] = xs[i]
			xs[i] = tmp
		} else {
			xs[n-1] = xs[0]
			xs[0] = tmp
		}
	}
	Permutations(xs, n-1, context, callback)
}

func ConcatenateDigits(digits []int, start int, stop int) int {
	concatenated := 0
	for i := start; i < stop; i++ {
		concatenated *= 10
		concatenated += digits[i]
	}
	return concatenated
}

func main() {
	digits := []int{1, 2, 3, 4, 5, 6, 7, 8, 9}
	context := make([]bool, 9999)
	Permutations(digits, 9, context, func(digits []int, context interface{}) {
		product := ConcatenateDigits(digits, 5, 9)
		if !context.([]bool)[product] {
			multiplier := digits[0]
			multiplicand := ConcatenateDigits(digits, 1, 5)
			if multiplier*multiplicand == product {
				context.([]bool)[product] = true
			} else {
				multiplier = ConcatenateDigits(digits, 0, 2)
				multiplicand = ConcatenateDigits(digits, 2, 5)
				if multiplier*multiplicand == product {
					context.([]bool)[product] = true
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

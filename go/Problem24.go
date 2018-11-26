/*
 * A permutation is an ordered arrangement of objects. For example, 3124 is one
 * possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
 * are listed numerically or alphabetically, we call it lexicographic order. The
 * lexicographic permutations of 0, 1 and 2 are:
 *
 * 012   021   102   120   201   210
 *
 * What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5,
 * 6, 7, 8 and 9?
 */
package main

import (
	"fmt"
	"math"
)

func Factorial(x int) (result int) {
	for result = 1; x > 0; x-- {
		result *= x
	}
	return
}

func PermutationAt(xs []int, n int) {
	if len(xs) < 2 {
		return
	}
	m := Factorial(len(xs) - 1)
	index := n / m
	x := xs[index]
	for i := index; i > 0; i-- {
		xs[i] = xs[i-1]
	}
	xs[0] = x
	PermutationAt(xs[1:], n-m*index)
}

func main() {
	digits := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	PermutationAt(digits, 999999)
	answer := 0
	for i, digit := range digits {
		answer += digit * int(math.Pow10(len(digits)-i-1))
	}
	fmt.Println(answer)
}

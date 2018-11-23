/*
 * The fraction ^49/[98] is a curious fraction, as an inexperienced mathematician
 * in attempting to simplify it may incorrectly believe that ^49/[98] = ^4/[8],
 * which is correct, is obtained by cancelling the 9s.
 *
 * We shall consider fractions like, ^30/[50] = ^3/[5], to be trivial examples.
 *
 * There are exactly four non-trivial examples of this type of fraction, less than
 * one in value, and containing two digits in the numerator and denominator.
 *
 * If the product of these four fractions is given in its lowest common terms,
 * find the value of the denominator.
 */
package main

import "fmt"

func main() {
	resultD := 1.0
	resultN := 1.0
	for i := 1; i <= 9; i++ {
		for j := 1; j <= 9; j++ {
			for k := 1; k <= 9; k++ {
				d := float64(i*10 + j)
				n := float64(j*10 + k)
				if d/n == float64(i)/float64(k) {
					resultD *= d
					resultN *= n
				}
			}
		}
	}
	fmt.Println(resultN / resultD)
}

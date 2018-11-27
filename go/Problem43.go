/*
 * The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
 * each of the digits 0 to 9 in some order, but it also has a rather interesting
 * sub-string divisibility property.
 *
 * Let d[1] be the 1^st digit, d[2] be the 2^nd digit, and so on. In this way, we
 * note the following:
 *
 *   • d[2]d[3]d[4]=406 is divisible by 2
 *   • d[3]d[4]d[5]=063 is divisible by 3
 *   • d[4]d[5]d[6]=635 is divisible by 5
 *   • d[5]d[6]d[7]=357 is divisible by 7
 *   • d[6]d[7]d[8]=572 is divisible by 11
 *   • d[7]d[8]d[9]=728 is divisible by 13
 *   • d[8]d[9]d[10]=289 is divisible by 17
 *
 * Find the sum of all 0 to 9 pandigital numbers with this property.
 */
package main

import (
	"fmt"
	"math"
)

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

func main() {
	digits := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	result := 0
	Permutations(digits, 10, func(xs []int) {
		if xs[0] != 0 &&
			xs[3]%2 == 0 &&
			(xs[2]+xs[3]+xs[4])%3 == 0 &&
			xs[5] == 5 &&
			(xs[4]*100+xs[5]*10+xs[6])%7 == 0 &&
			(xs[5]*100+xs[6]*10+xs[7])%11 == 0 &&
			(xs[6]*100+xs[7]*10+xs[8])%13 == 0 &&
			(xs[7]*100+xs[8]*10+xs[9])%17 == 0 {
			for i := 0; i < 10; i++ {
				result += xs[i] * int(math.Pow10(9-i))
			}
		}
	})
	fmt.Println(result)
}

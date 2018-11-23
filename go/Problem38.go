/*
 * Take the number 192 and multiply it by each of 1, 2, and 3:
 *
 *     192 × 1 = 192
 *     192 × 2 = 384
 *     192 × 3 = 576
 *
 * By concatenating each product we get the 1 to 9 pandigital, 192384576. We will
 * call 192384576 the concatenated product of 192 and (1,2,3)
 *
 * The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and
 * 5, giving the pandigital, 918273645, which is the concatenated product of 9 and
 * (1,2,3,4,5).
 *
 * What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
 * concatenated product of an integer with (1,2, ... , n) where n > 1?
 */
package main

import (
	"fmt"
	"math"
)

func IsPandigital(x int) bool {
	if x%9 != 0 {
		return false
	}
	flags := 1
	for ; x > 0; x /= 10 {
		flags |= 1 << uint(x%10)
	}
	return flags == 0x3ff
}

func ConcatenateDigits(x int, y int) int {
	r := int(math.Log10(float64(y))) + 1
	return x*int(math.Pow10(r)) + y
}

func main() {
	limit := 9877
	max := 0
	for i := 0; i < limit; i++ {
		result := 0
		for j := 1; j < 10; j++ {
			result = ConcatenateDigits(result, i*j)
			if result > 999999999 {
				break
			}
			if IsPandigital(result) && max < result {
				max = result
				break
			}
		}
	}
	fmt.Println(max)
}

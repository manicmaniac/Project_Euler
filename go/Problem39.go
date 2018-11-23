/*
 * If p is the perimeter of a right angle triangle with integral length sides, {a,
 * b,c}, there are exactly three solutions for p = 120.
 *
 * {20,48,52}, {24,45,51}, {30,40,50}
 *
 * For which value of p ≤ 1000, is the number of solutions maximised?
 */
package main

import (
	"fmt"
	"math"
)

func main() {
	maxCount := 0
	maxI := 0
	for i := 12; i < 1000; i += 12 {
		count := 0
		for s := 1; s < i; s++ {
			for t := s; t < i-s; t++ {
				u := math.Hypot(float64(s), float64(t))
				_, fractional := math.Modf(u)
				if fractional == 0 && s+t+int(u) == i {
					count++
				}
			}
		}
		if maxCount < count {
			maxCount = count
			maxI = i
		}
	}
	fmt.Println(maxI)
}

/*
 * Starting in the top left corner of a 2×2 grid, there are 6 routes (without
 * backtracking) to the bottom right corner.
 *
 * [p_015]
 *
 * How many routes are there through a 20×20 grid?
 */
package main

import "fmt"

func c(n int, r int) float64 {
	result := 1.0
	for i := r + 1; i < n+1; i++ {
		result *= float64(i)
	}
	for i := 1; i < r+1; i++ {
		result /= float64(i)
	}
	return result
}

func main() {
	fmt.Printf("%.0f", c(40, 20))
}

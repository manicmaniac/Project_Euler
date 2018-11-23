/*
 * It is possible to write five as a sum in exactly six different ways:
 *
 * 4 + 1
 * 3 + 2
 * 3 + 1 + 1
 * 2 + 2 + 1
 * 2 + 1 + 1 + 1
 * 1 + 1 + 1 + 1 + 1
 *
 * How many different ways can one hundred be written as a sum of at least two
 * positive integers?
 */
package main

import "fmt"

func npartitions(n int) int {
	cache := make([]int, n+1)
	cache[0] = 1
	for i := 1; i <= n; i++ {
		for j := i; j <= n; j++ {
			cache[j] += cache[j-i]
		}
	}
	result := cache[n]
	return result
}

func main() {
	answer := npartitions(100)
	fmt.Println(answer)
}

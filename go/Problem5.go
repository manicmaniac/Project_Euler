/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */
package main

import "fmt"

func GCD(x int, y int) int {
	if y == 0 {
		return x
	}
	return GCD(y, x%y)
}

func LCM(x int, y int) int {
	return x * y / GCD(x, y)
}

func main() {
	result := 1
	for i := 1; i <= 20; i++ {
		result = LCM(result, i)
	}
	fmt.Println(result)
}

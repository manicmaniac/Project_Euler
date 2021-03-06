/*
 * Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
 * If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.
 *
 * For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
 *
 * Evaluate the sum of all the amicable numbers under 10000.
 */
package main

import "fmt"

func SumOfDivisors(x int) (result int) {
	for i := 1; i < (x/2 + 1); i++ {
		if x%i == 0 {
			result += i
		}
	}
	return
}

func HasAmicable(x int) bool {
	sum := SumOfDivisors(x)
	return sum != x && SumOfDivisors(sum) == x
}

func main() {
	result := 0
	for i := 2; i < 10000; i++ {
		if HasAmicable(i) {
			result += i
		}
	}
	fmt.Println(result)
}

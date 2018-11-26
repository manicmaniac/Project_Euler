/*
 * The Fibonacci sequence is defined by the recurrence relation:
 *
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 *
 * It turns out that F[541], which contains 113 digits, is the first Fibonacci
 * number for which the last nine digits are 1-9 pandigital (contain all the
 * digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
 * digits, is the first Fibonacci number for which the first nine digits are 1-9
 * pandigital.
 *
 * Given that F[k] is the first Fibonacci number for which the first nine digits
 * AND the last nine digits are 1-9 pandigital, find k.
 */
package main

import (
	"fmt"
	"math"
)

var log10Phi = math.Log10((1.0 + math.Sqrt(5.0)) / 2.0)
var log10Sqrt5 = math.Log10(5) / 2.0

func UpperFibonacciAt(n int, precision int) int64 {
	log10Fib := float64(n+1)*log10Phi - log10Sqrt5
	if log10Fib > float64(precision) {
		_, fractional := math.Modf(log10Fib)
		log10Fib = float64(precision) + fractional
	}
	return int64(math.Round(math.Pow(10.0, log10Fib-1.0)))
}

func GenerateLowerFibonaccies(precision int, callback func(n int, fib int64, precision int) bool) {
	a := int64(0)
	b := int64(1)
	next := true
	divisor := int64(math.Pow10(precision))
	for n := 0; next; n++ {
		a, b = b, (a+b)%divisor
		next = callback(n, a, precision)
	}
}

func IsPandigital(x int64) bool {
	if x%9 != 0 {
		return false
	}
	flags := 1
	for ; x > 0; x /= 10 {
		flags |= 1 << uint(x%10)
	}
	return flags == 0x3ff
}

func main() {
	precision := 9
	GenerateLowerFibonaccies(precision, func(n int, fib int64, precision int) bool {
		if IsPandigital(fib) && IsPandigital(UpperFibonacciAt(n, precision)) {
			fmt.Println(n + 1)
			return false
		}
		return true
	})
}

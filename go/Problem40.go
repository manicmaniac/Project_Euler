/*
 * An irrational decimal fraction is created by concatenating the positive
 * integers:
 *
 * 0.123456789101112131415161718192021...
 *
 * It can be seen that the 12^th digit of the fractional part is 1.
 *
 * If d[n] represents the n^th digit of the fractional part, find the value of the
 * following expression.
 *
 * d[1] × d[10] × d[100] × d[1000] × d[10000] × d[100000] × d[1000000]
 */
package main

import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

func main() {
	result := make([]string, 1000000)
	for i := 0; i < 1000000; i++ {
		result[i] = strconv.Itoa(i)
	}
	s := strings.Join(result, "")
	product := 1
	for i := 0; i < 7; i++ {
		x := int(s[int(math.Pow10(i))]) - 48
		product *= x
	}
	fmt.Println(product)
}

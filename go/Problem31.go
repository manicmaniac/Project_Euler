/*
 * In England the currency is made up of pound, £, and pence, p, and there are
 * eight coins in general circulation:
 *
 *     1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
 *
 * It is possible to make £2 in the following way:
 *
 *     1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
 *
 * How many different ways can £2 be made using any number of coins?
 */
package main

import "fmt"

func Currency(amount int, coins []int) int {
	if amount <= 0 || len(coins) <= 0 {
		if amount == 0 {
			return 1
		}
		return 0
	}
	return Currency(amount, coins[1:]) + Currency(amount-coins[0], coins)
}

func main() {
	coins := []int{200, 100, 50, 20, 10, 5, 2, 1}
	result := Currency(200, coins)
	fmt.Println(result)
}

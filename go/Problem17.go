/*
 * If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 *
 * If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
 *
 * NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
 */
package main

import "fmt"

var Roman_1_19 = []string{
	"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
	"eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
}

var Roman_20_90 = []string{
	"", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety",
}

func IntToRoman(x int) (roman string) {
	if x == 0 {
		roman = "zero"
	}
	for x > 0 {
		if x < 20 {
			roman += Roman_1_19[x]
			break
		}
		if x < 100 {
			roman += Roman_20_90[x/10]
			x %= 10
		} else if x < 1000 {
			roman += Roman_1_19[x/100]
			roman += "handred"
			x %= 100
			if x == 0 {
				break
			}
			roman += "and"
		} else if x == 1000 {
			roman = "onethousand"
			break
		}
	}
	return
}

func main() {
	count := 0
	for i := 1; i <= 1000; i++ {
		count += len(IntToRoman(i))
	}
	fmt.Println(count)
}

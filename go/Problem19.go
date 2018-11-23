/*
 * You are given the following information, but you may prefer to do some research
 * for yourself.
 *
 *   • 1 Jan 1900 was a Monday.
 *   • Thirty days has September,
 *     April, June and November.
 *     All the rest have thirty-one,
 *     Saving February alone,
 *     Which has twenty-eight, rain or shine.
 *     And on leap years, twenty-nine.
 *   • A leap year occurs on any year evenly divisible by 4, but not on a century
 *     unless it is divisible by 400.
 *
 * How many Sundays fell on the first of the month during the twentieth century (1
 * Jan 1901 to 31 Dec 2000)?
 */
package main

import (
	"fmt"
	"time"
)

var UTCLocation = time.FixedZone("UTC", 0)

func main() {
	count := 0
	for y := 1901; y <= 2000; y++ {
		for m := 1; m <= 12; m++ {
			t := time.Date(y, time.Month(m), 1, 0, 0, 0, 0, UTCLocation)
			if t.Weekday() == time.Sunday {
				count++
			}
		}
	}
	fmt.Println(count)
}

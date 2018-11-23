/*
 * Comparing two numbers written in index form like 2^11 and 3^7 is not difficult,
 * as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.
 *
 * However, confirming that 632382^518061 > 519432^525806 would be much more
 * difficult, as both numbers contain over three million digits.
 *
 * Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file
 * containing one thousand lines with a base/exponent pair on each line, determine
 * which line number has the greatest numerical value.
 *
 * NOTE: The first two lines in the file represent the numbers in the example
 * given above.
 */
package main

import (
	"encoding/csv"
	"fmt"
	"math"
	"os"
	"strconv"
)

func main() {
	file, err := os.Open("../resources/base_exp.txt")
	if err != nil {
		panic(err)
	}
	reader := csv.NewReader(file)
	rows, err := reader.ReadAll()
	if err != nil {
		panic(err)
	}
	maxValue := 0.0
	maxI := 0
	for i, row := range rows {
		base, err := strconv.ParseFloat(row[0], 64)
		if err != nil {
			panic(err)
		}
		exp, err := strconv.ParseFloat(row[1], 64)
		if err != nil {
			panic(err)
		}
		value := math.Log(base) * exp
		if maxValue < value {
			maxValue = value
			maxI = i
		}
	}
	fmt.Println(maxI + 1)
}

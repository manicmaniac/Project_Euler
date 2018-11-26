/*
 * Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
 * containing over five-thousand first names, begin by sorting it into
 * alphabetical order. Then working out the alphabetical value for each name,
 * multiply this value by its alphabetical position in the list to obtain a name
 * score.
 *
 * For example, when the list is sorted into alphabetical order, COLIN, which is
 * worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
 * obtain a score of 938 × 53 = 49714.
 *
 * What is the total of all the name scores in the file?
 */
package main

import (
	"encoding/csv"
	"fmt"
	"os"
	"sort"
)

func CalcNameScore(name string) (score int) {
	for _, value := range name {
		score += int(value) - 64
	}
	return
}

func main() {
	file, err := os.Open("../resources/names.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()
	reader := csv.NewReader(file)
	rows, err := reader.ReadAll()
	if err != nil {
		panic(err)
	}
	names := rows[0]
	sort.Strings(names)
	totalScore := 0
	for i, name := range names {
		totalScore += CalcNameScore(name) * (i + 1)
	}
	fmt.Println(totalScore)
}

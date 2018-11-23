/*
 * The n^th term of the sequence of triangle numbers is given by, t[n] = ½n(n+1);
 * so the first ten triangle numbers are:
 *
 * 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 *
 * By converting each letter in a word to a number corresponding to its
 * alphabetical position and adding these values we form a word value. For
 * example, the word value for SKY is 19 + 11 + 25 = 55 = t[10]. If the word value
 * is a triangle number then we shall call the word a triangle word.
 *
 * Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
 * containing nearly two-thousand common English words, how many are triangle
 * words?
 */
package main

import (
	"encoding/csv"
	"fmt"
	"math"
	"os"
)

func IsTriangle(x int) bool {
	_, fractional := math.Modf((math.Sqrt(float64(8*x+1)) - 1) / 2)
	return fractional == 0.0
}

func CalcWordScore(word string) int {
	result := 0
	for _, c := range word {
		result += int(c) - 64
	}
	return result
}

func main() {
	file, err := os.Open("../resources/words.txt")
	if err != nil {
		panic(err)
	}
	defer file.Close()
	reader := csv.NewReader(file)
	rows, err := reader.ReadAll()
	if err != nil {
		panic(err)
	}
	words := rows[0]
	count := 0
	for _, word := range words {
		score := CalcWordScore(word)
		if IsTriangle(score) {
			count++
		}
	}
	fmt.Println(count)
}

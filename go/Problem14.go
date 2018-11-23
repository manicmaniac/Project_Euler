package main

import "fmt"

func FindLogestCollatzChain(limit int) int {
	cache := make(map[int]int)
	longestStart := 0
	longestLength := 0
	for start := 1; start < limit; start += 2 {
		length := 1
		for i := start; i > 1; length++ {
			if i%2 == 0 {
				i /= 2
			} else {
				i = 3*i + 1
			}
			if i <= limit && cache[i] > 0 {
				length += cache[i]
				break
			}
		}
		if longestLength < length {
			longestStart = start
			longestLength = length
		}
		cache[start] = length
	}
	return longestStart
}

func main() {
	fmt.Println(FindLogestCollatzChain(1000000))
}

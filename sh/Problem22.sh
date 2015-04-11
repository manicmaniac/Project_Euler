#!/bin/sh

# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into
# alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to obtain a name
# score.
# 
# For example, when the list is sorted into alphabetical order, COLIN, which is
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
# obtain a score of 938 × 53 = 49714.
# 
# What is the total of all the name scores in the file?

# score () {
# 	echo -n ABCDEFGHIJKLMNOPQRSTUVWXYZ | sed -E "s/./&\n/g" |
# 	( echo -n $1 | sed -E "s/./&\n/g" | sort | diff -u /dev/fd/3 -) 3<&0 |
# 	tail -n +4 | cat -n | grep -v '-' | cut -f1 | paste -sd+ | bc
# }
# 
# sed -e 's/"//g;s/,/\n/g' ../resources/names.txt | sort

cat ../resources/names.txt | grep -oE '[A-Z]*' | sort | cat -n | sed -e '{
	s/	/*(/g
	s/A/1+/g
	s/B/2+/g
	s/C/3+/g
	s/D/4+/g
	s/E/5+/g
	s/F/6+/g
	s/G/7+/g
	s/H/8+/g
	s/I/9+/g
	s/J/10+/g
	s/K/11+/g
	s/L/12+/g
	s/M/13+/g
	s/N/14+/g
	s/O/15+/g
	s/P/16+/g
	s/Q/17+/g
	s/R/18+/g
	s/S/19+/g
	s/T/20+/g
	s/U/21+/g
	s/V/22+/g
	s/W/23+/g
	s/X/24+/g
	s/Y/25+/g
	s/Z/26+/g
	s/$/0)/g
}' | paste -sd+ - | bc


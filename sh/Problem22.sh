#!/bin/sh
:<<'###'
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
containing over five-thousand first names, begin by sorting it into
alphabetical order. Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name
score.

For example, when the list is sorted into alphabetical order, COLIN, which is
worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
###

score () {
	echo -n ABCDEFGHIJKLMNOPQRSTUVWXYZ | sed -E "s/./&\n/g" |
	( echo -n $1 | sed -E "s/./&\n/g" | sort | diff -u /dev/fd/3 -) 3<&0 |
	tail -n +4 | cat -n | grep -v '-' | cut -f1 | paste -sd+ | bc
}

sed -e 's/"//g;s/,/\n/g' names.txt | sort


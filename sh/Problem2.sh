#!/bin/sh

# Each new term in the Fibonacci sequence is generated by adding the previous two
# terms. By starting with 1 and 2, the first 10 terms will be:
# 
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# 
# By considering the terms in the Fibonacci sequence whose values do not exceed
# four million, find the sum of the even-valued terms.

fib() {
	set 0 1
	while :
	do
		set $2 $(( $1 + $2 )) 2> /dev/null
		echo $1
	done
}

fib | while read x
do
	test $x -le 4000000 && echo $x
done | grep -E '[02468]$' | paste -sd+ | bc


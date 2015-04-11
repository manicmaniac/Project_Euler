#!/bin/sh

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.

seq() {
    while [ $1 -le $3 ]
    do
        echo $1
        set $(($1 + $2)) $2 $3
    done
}

(seq 3 3 999; seq 5 5 999) | sort -nu | paste -sd+ - | bc


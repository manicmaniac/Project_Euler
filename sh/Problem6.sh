#!/bin/bash
#The sum of the squares of the first ten natural numbers is,
#
#1^2 + 2^2 + ... + 10^2 = 385
#
#The square of the sum of the first ten natural numbers is,
#
#(1 + 2 + ... + 10)^2 = 55^2 = 3025
#
#Hence the difference between the sum of the squares of the first ten natural
#numbers and the square of the sum is 3025 − 385 = 2640.
#
#Find the difference between the sum of the squares of the first one hundred
#natural numbers and the square of the sum.

function pow() {
    local res=1
    local i=1
    while [ `expr $2 - $i` -ge 0 ]
    do
        res=`expr $res \* $1`
        i=`expr $i + 1`
    done
    echo $res
}


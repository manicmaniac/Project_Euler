#!/bin/bash
:<<'###'
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
###

function gen_palindromic() {
    echo $1`rev <<<$1`
}

function is_product_of_3digit() {
    for i in {100..999}
    do
        if [ $(($1 % $i)) -eq 0 ] && [ $(($1 / $i)) -lt 1000 ]; then
            return 0
        fi
    done
    return 1
}

seq 999 -1 100 | {
while read x
    do
        ans=`gen_palindromic $x`
        is_product_of_3digit $ans && echo $ans && break
    done
}


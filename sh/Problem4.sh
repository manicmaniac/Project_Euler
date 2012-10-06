#!/bin/bash
:<<'###'
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
###

function is_palindromic() {
    test $1 = `rev <<<$1`
}

function is_product_of_3digit() {
    local x=$1
    for i in {100..999}
    do
        if [ $(($x % $i)) -eq 0 ] && [ $(($x / $i)) -lt 1000 ]; then
            return 0
        fi
    done
    return 1
}

for i in {998001..10000}
do
    if `is_palindromic $i` && `is_product_of_3digit $i`; then
        echo $i
        break
    fi
done


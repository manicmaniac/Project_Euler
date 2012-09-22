#!/bin/bash
#A palindromic number reads the same both ways. The largest palindrome made from
#the product of two 2-digit numbers is 9009 = 91 × 99.
#
#Find the largest palindrome made from the product of two 3-digit numbers.

function fib()
{
    local res
    local s=0
    local t=1
    local tmp=0
    while [ $t -lt $1 ]
    do
        tmp=$s; s=$t; t=`expr $t + $tmp`
        res+=($s)
    done
    echo ${res[@]}
}

ans=0
for i in `fib 4000000`
do
    if [ `expr $i % 2` -eq 0 ]; then
        ans=`expr $ans + $i`
    fi
done

echo $ans


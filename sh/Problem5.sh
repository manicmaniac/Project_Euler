#!/bin/bash
#2520 is the smallest number that can be divided by each of the numbers from 1
#to 10 without any remainder.
#
#What is the smallest positive number that is evenly divisible by all of the
#numbers from 1 to 20?

function gcd() {
    local x=0
    local y=0
    if [ `expr $1 - $2` -gt 0 ]; then
        x=$1
        y=$2
    else
        x=$2
        y=$1
    fi
    while [ `expr $x % $y` -ne 0 ]
    do
        tmp=$x
        x=$y
        y=`expr $tmp % $y`
    done
    echo $y
}

function lcm() {
    echo `expr $(expr $1 \* $2) / $(gcd $1 $2)`
}

i=2
res=2
while [ $i -lt 21 ]
do
    i=`expr $i + 1`
    res=`lcm $i $res`
done
echo $res


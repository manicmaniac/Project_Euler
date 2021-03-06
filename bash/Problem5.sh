#!/bin/bash
:<<'###'
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
###

function gcd() {
    local {x,y}=0
    if [ $(($1 - $2)) -gt 0 ]; then
        x=$1; y=$2
    else
        x=$2; y=$1
    fi
    while [ $(($x % $y)) -ne 0 ]
    do
        tmp=$x; x=$y
        let y=$tmp%$y
    done
    echo $y
}

function lcm() {
    bc <<<$1*$2/`gcd $1 $2`
}

for i in {1..20}
do
    ans=`lcm $i ${ans:-1}`
done

echo $ans


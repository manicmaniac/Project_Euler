#!/bin/bash
#2520 is the smallest number that can be divided by each of the numbers from 1
#to 10 without any remainder.
#
#What is the smallest positive number that is evenly divisible by all of the
#numbers from 1 to 20?

function gcd() {
    if [ `expr $1 - $2` -gt 0 ]; then
        _x=$1
        _y=$2
    else
        _x=$2
        _y=$1
    fi
    while [ `expr $_x % $_y` -ne 0 ]
    do
        _tmp=$_x
        _x=$_y
        _y=`expr $_tmp % $_y`
    done
    echo $_y
}

function lcm() {
    _xy=`expr $1 \* $2`
    _gcd=`gcd $1 $2`
    echo `expr $_xy / $_gcd`
}

i=2
res=2
while [ $i -lt 21 ]
do
    i=`expr $i + 1`

    res=`lcm $i $res`
done
echo $res

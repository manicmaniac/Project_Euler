#!/bin/bash
#A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
#a^2 + b^2 = c^2
#
#For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
#There exists exactly one Pythagorean triplet for which a + b + c = 1000.
#Find the product abc.

for m in `seq 23`
do
    for n in `seq 23` 
    do
        a=`expr $m \* $m - $n \* $n`
        b=`expr 2 \* $m \* $n`
        c=`expr $m \* $m + $n \* $n`
        if [ `expr $a + $b + $c` -eq 1000 ]; then
            echo `expr $a \* $b \* $c`
        fi
    done
done


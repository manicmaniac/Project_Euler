#!/bin/bash
:<<'###'
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
###

for m in {1..23}
do
    for n in {1..23}
    do
        let {a=$m*$m-$n*$n,b=2*$m*$n,c=$m*$m+$n*$n}
        if [ $(($a + $b + $c)) -eq 1000 ]; then
            echo $(($a * $b * $c)); break
        fi
    done
done


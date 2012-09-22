#!/bin/bash
# -*- coding:utf-8 -*-
#If we list all the natural numbers below 10 that are multiples of 3 or 5, we
#get 3, 5, 6 and 9. The sum of these multiples is 23.
#
#Find the sum of all the multiples of 3 or 5 below 1000.

for i in {1..999}
do
    if [ $(($i % 3 * $i % 5)) -eq 0 ]; then
        let res+=$i
    fi
done
echo $res


#!/bin/bash
# -*- coding:utf-8 -*-
#If we list all the natural numbers below 10 that are multiples of 3 or 5, we
#get 3, 5, 6 and 9. The sum of these multiples is 23.
#
#Find the sum of all the multiples of 3 or 5 below 1000.

i=1
res=0
while [ $i -lt 1000 ]
do
    if [ `expr $i % 3` -eq 0 ]; then
        res=`expr $res + $i`
    elif [ `expr $i % 5` -eq 0 ]; then
        res=`expr $res + $i`
    fi
    i=`expr $i + 1`
done
echo $res

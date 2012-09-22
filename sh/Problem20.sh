#!/bin/bash
#n! means n × (n − 1) × ... × 3 × 2 × 1
#
#For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
#and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
#Find the sum of the digits in the number 100!

res=1
for i in `seq 2 100`
do
    res=`echo "$res * $i" | bc`
done

digits=(`echo $res | sed -e 's/[\\\\\ ]//g' | sed -e 's/./& /g'`)

ans=0
for i in ${digits[@]}
do
    ans=`expr $ans + $i`
done

echo $ans


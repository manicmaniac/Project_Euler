#!/bin/bash
#2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
#What is the sum of the digits of the number 2^1000?

res=`echo '2^1000' | bc | sed -e 's/\\\\//g; s/./& /g'`

ans=0
for i in ${res[@]}
do
    let ans+=$i
done
echo $ans


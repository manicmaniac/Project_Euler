#!/bin/bash
#The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
#
#Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

res=$(echo 0 `seq 1000 | sed -e 's/.*/+&^&/g'` | bc | tail -2 | paste -s | sed 's/\\\s*//g')

last=`echo $res | wc -m`
start=`expr $last - 10`

echo $res | cut -c $start-$last


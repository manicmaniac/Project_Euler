#!/bin/bash
:<<'###'
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of
their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
###

factorial=(0 1 2 6 24 120 720 5040 40320 362880)

function is_curious() {
    local {x=$1,res=0}
    for i in `echo $x | sed 's/./& /g'`
    do
        res=`echo $res + ${factorial[$i]} | bc`
    done
    if [ $res -eq $x ]; then
        return 0
    else
        return 1
    fi
}

let limit=${factorial[9]}*7
i=3; ans=0
while [ $i -lt $limit ]
do
    if `is_curious $i`; then
        let ans+=$i
    fi
    let i++
done

echo $ans


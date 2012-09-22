#!/bin/bash
#The prime factors of 13195 are 5, 7, 13 and 29.
#
#What is the largest prime factor of the number 600851475143 ?

function factorize() {
    local n=$1
    local i=2
    while [ `expr $n - $i \* $i` -gt 0 ]
    do
        if [ `expr $n % $i` -eq 0 ]; then
            n=`expr $n / $i`
            echo -n "$i "
        else
            i=`expr $i + 1`
        fi
    done
    echo -n $n
}

ans=(`factorize 600851475143`)
last=`expr ${#ans[*]} - 1`
echo ${ans[$last]}


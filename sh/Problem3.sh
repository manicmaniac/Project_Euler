#!/bin/bash
#The prime factors of 13195 are 5, 7, 13 and 29.
#
#What is the largest prime factor of the number 600851475143 ?

function factorize() {
    local {n=$1,i=2}
    while [ $(($n - $i * $i)) -gt 0 ]
    do
        if [ $(($n % $i)) -eq 0 ]; then
            let n=$n/$i
            echo -n "$i "
        else
            let i++
        fi
    done
    echo -n $n
}

ans=(`factorize 600851475143`)
let last=${#ans[*]}-1
echo ${ans[$last]}


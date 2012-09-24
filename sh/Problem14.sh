#!/bin/bash
#The following iterative sequence is defined for the set of positive integers:
#
#n → n/2 (n is even)
#n → 3n + 1 (n is odd)
#
#Using the rule above and starting with 13, we generate the following sequence:
#
#13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#
#It can be seen that this sequence (starting at 13 and finishing at 1) contains
#10 terms. Although it has not been proved yet (Collatz Problem), it is thought
#that all starting numbers finish at 1.
#
#Which starting number, under one million, produces the longest chain?
#
#NOTE: Once the chain starts the terms are allowed to go above one million.

function collatz_length() {
    local {n=$1,res=1,cache}
    while [ $n -gt 1 ]
    do
        if [ $(($n % 2)) -eq 0 ]; then
            let n=$n/2
        else
            let n=3*$n+1
            if [ ${cache[$n]:-0} -ne 0 ]; then
                let res+=${cache[$n]}
                break
            fi
        fi
        let res++
    done
    echo $res
}

function res() {
    for i in {1..1000000..2}
    do
        echo "$i `collatz_length $i`"
    done
}

ans=`res | sort --key=2 -nr | head -1 | cut -d ' ' -f 1`

echo $ans


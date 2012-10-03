#!/bin/bash
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
#the 6th prime is 13.
#
#What is the 10 001st prime number?

function is_prime() {
    local x=$1
    if [ $x -lt 2 ]; then
        return 1
    else
        for i in `seq 2 $(echo "sqrt($x) + 1" | bc)`
        do
            if [ $(($x % $i)) -eq 0 ]; then
                return 1
            fi
        done
        return 0
    fi
}

i=1; cnt=2; limit=10001
while : 
do
    if `is_prime $(($i * 6 - 1))`; then
        let cnt++
        if [ $cnt -ge $limit ]; then
            echo $(($i * 6 - 1))
            break
        fi
    fi
    if `is_prime $(($i * 6 + 1))`; then
        let cnt++
        if [ $cnt -ge $limit ]; then
            echo $(($i * 6 + 1))
            break
        fi
    fi
    let i++
done


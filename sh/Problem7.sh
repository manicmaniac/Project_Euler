#!/bin/bash
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
#the 6th prime is 13.
#
#What is the 10 001st prime number?

function is_prime {
    if [ $1 -lt 2 ]; then
        echo 0
        exit
    fi
    local i=2
    while [ `expr $1 - $i \* $i` -ge 0 ]
    do
        if [ `expr $1 % $i` -eq 0 ]; then
            echo 0
            exit
        fi
        i=`expr $i + 1`
    done
    echo 1
}

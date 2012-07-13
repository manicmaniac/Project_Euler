#!/bin/bash
#The prime factors of 13195 are 5, 7, 13 and 29.
#
#What is the largest prime factor of the number 600851475143 ?

function factorize() {
    _n=$1
    _i=2
    while [ `expr $_n - $_i \* $_i` -gt 0 ]
    do
        if [ `expr $_n % $_i` -eq 0 ]; then
            _n=`expr $_n / $_i`
            echo $_i
        else
            _i=`expr $_i + 1`
        fi
    done
    echo $_n
}

factorize 600851475143

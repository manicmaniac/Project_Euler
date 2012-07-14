#!/bin/bash
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
#the 6th prime is 13.
#
#What is the 10 001st prime number?

function is_prime {
    if [ $1 -lt 2 ]; then
        return 0
    fi
    local i=2
    while [ `expr $1 - $i \* $i` -ge 0 ]
    do
        if [ `expr $1 % $i` -eq 0 ]; then
            return 1
        fi
        i=`expr $i + 1`
    done
    return 0
}

function find_prime {
    local i=1
    local count_prime=2
    local primes=(2 3)
    while [ `expr $1 - $count_prime` -ge 0 ]
    do
        s=`expr $i \* 6 - 1`
        is_prime $s && primes+=($s) && count_prime=`expr $count_prime + 1`
        if [ `expr $1 - $count_prime` -le 0 ]; then
            echo $primes
            return 0
        fi
        t=`expr $i \* 6 + 1`
        is_prime $t && primes+=($t) && count_prime=`expr $count_prime + 1`
        i=`expr $i + 1`
    done
    for var in $primes
    do
        print $var
    done
}

is_prime 6 && echo "true"
find_prime 10

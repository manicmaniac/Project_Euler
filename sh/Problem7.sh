#!/bin/bash
:<<'###'
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
###

function is_prime() {
    local x=$1
    local -a factors="(`factor $x`)"
    test ${#factors[*]} -eq 2
}

function nth_prime() {
    local {n=$1,i=3}
    echo 2
    while [ $n -gt 1 ]
    do
        if is_prime $i; then
            echo $i
            let n--
        fi
        let i+=2
    done
}

nth_prime 10001 | tail -1


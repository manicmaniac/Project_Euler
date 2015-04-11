#!/bin/sh

# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

max_factor() {
    (
        while [ $(($1 % 2)) -eq 0 ]
        do
            echo $1
            set $(($1 / 2))
        done
        set $1 3
        while [ $1 -ge $2 ]
        do
            if [ $(($1 % $2)) -ne 0 ]; then
                set $1 $(($2 + 2))
            else
                echo $1
                set $(($1 / $2)) $2
            fi
        done
    ) | tail -n 1
}

max_factor 600851475143


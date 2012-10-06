#!/bin/bash
:<<'###'
It can be seen that the number, 125874, and its double, 251748, contain exactly
the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
contain the same digits.
###

function make_dialnumber() {
    local {x=$1,res}
    for i in {1..6}
    do
        echo "$x * $i" | bc
    done
}

function is_dialnumber() {
    local {x=$1,res}
    res=$(echo $(make_dialnumber $x) | sed -e "s/[$x ]//g")
    if [ ${res:-'null'} = 'null' ]; then
        return 0
    else
        return 1
    fi
}

for i in {100000..199999}
do
    if `is_dialnumber $i`; then
        echo $i
        break
    fi
done


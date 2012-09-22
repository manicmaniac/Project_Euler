#!/bin/bash
#Starting in the top left corner of a 2×2 grid, there are 6 routes (without
#backtracking) to the bottom right corner.
#
#[p_015]
#
#How many routes are there through a 20×20 grid?

function c() {
    local a=$1
    local b=$2
    local start=`expr $b + 1`
    local multi=1
    local fact=1
    for i in `seq $start $a`
    do
        multi=`echo "$multi * $i" | bc`
    done
    for j in `seq $b`
    do
        fact=`echo "$fact * $j" | bc`
    done
    echo `echo "$multi / $fact" | bc`
}

c 40 20


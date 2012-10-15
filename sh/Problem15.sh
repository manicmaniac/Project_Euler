#!/bin/bash
:<<'###'
Starting in the top left corner of a 2×2 grid, there are 6 routes (without
backtracking) to the bottom right corner.

[p_015]

How many routes are there through a 20×20 grid?
###

function c() {
    bc <<<$(seq -s '*' $(($2 + 1)) $1 | bc)/$(seq -s '*' $2 | bc)
}

c 40 20


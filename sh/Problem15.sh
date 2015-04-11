#!/bin/sh

c() {
    {
        seq $2 $1 | sed -e 1d | paste -sd\* -
        echo /
        seq $2 | paste -sd\* - | bc
    } | paste -s - | bc
}

c 40 20


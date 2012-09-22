#!/bin/bash
#The n^th term of the sequence of triangle numbers is given by, t[n] = ½n(n+1);
#so the first ten triangle numbers are:
#
#1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
#By converting each letter in a word to a number corresponding to its
#alphabetical position and adding these values we form a word value. For
#example, the word value for SKY is 19 + 11 + 25 = 55 = t[10]. If the word value
#is a triangle number then we shall call the word a triangle word.
#
#Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
#containing nearly two-thousand common English words, how many are triangle
#words?

FILE='./words.txt'

data=`cat $FILE | sed -e 's/"//g' | tr -cs '[A-Z]' '[\n*]'`

function ord() {
    echo `expr $(printf "%d" \'$1) - 64`
}

function score() {
    local word=$1
    local res=0
    for i in `echo $word | sed -e 's/./& /g'`
    do
        tmp=`ord $i`
        res=`expr $res + $tmp`
    done
    echo $res
}

function is_triangle() {
    local x=$1
    scale=1
    if [ `echo "scale=1; ((sqrt(8 * $x + 1) - 1) / 2)" | bc -l | sed -e 's/.*\.//g'` -eq 0 ]; then
        echo true
    else
        echo false
    fi
}

ans=0
for i in $data
do
    if [ `is_triangle $(score $i)` = 'true' ]; then
        echo $i
        ans=`expr $ans + 1`
    fi
done

echo $ans


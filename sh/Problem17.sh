#!/bin/bash
:<<'###'
If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
letters. The use of "and" when writing out numbers is in compliance with
British usage.
###

dic=('' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten' 'eleven' 'twelve' 'thirteen' 'fourteen' 'fifteen' 'sixteen' 'seventeen' 'eighteen' 'nineteen' 'twenty')
dic[30]='thirty'
dic[40]='forty'
dic[50]='fifty'
dic[60]='sixty'
dic[70]='seventy'
dic[80]='eighty'
dic[90]='ninety'
dic[100]='handred'
dic[1000]='onethousand'

function num_to_en() {
    local {x=$1,res=$2,tmp=''}

    if [ $x -eq 0 ]; then
        echo $res

    elif [ $x -eq 1000 ]; then
        echo ${dic[$x]}

    elif [ $(($x % 100)) -eq 0 ]; then
        res+=${dic[$(($x / 100))]}
        res+=${dic[100]}
        echo $res

    elif [ $x -le 20 ]; then
        res+=${dic[$x]}
        echo $res

    elif [ $x -gt 20 ] && [ $x -lt 100 ]; then
        res+=`num_to_en $(($x % 10)) "$res${dic[$(($x - $x % 10))]}"`
        echo $res

    elif [ $x -ge 100 ]; then
        res+="$res${dic[$(($x / 100))]}${dic[100]}and"
        res+=`num_to_en $(($x % 100))`
        echo $res
    fi

}

function res() {
    for i in {1..1000}
    do
        echo `num_to_en $i`
    done
}

let ans=`res | wc -m`-1000

echo $ans


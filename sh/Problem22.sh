#!/bin/bash
#Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
#containing over five-thousand first names, begin by sorting it into
#alphabetical order. Then working out the alphabetical value for each name,
#multiply this value by its alphabetical position in the list to obtain a name
#score.
#
#For example, when the list is sorted into alphabetical order, COLIN, which is
#worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
#obtain a score of 938 × 53 = 49714.
#
#What is the total of all the name scores in the file?

FILE='./names.txt'


data=`cat $FILE | sed -e 's/"//g' | tr -cs '[A-Z]' '[\n*]' | sort`

function ord() {
    echo $((`printf "%d" \'$1` - 64))
}

function score() {
    local {name=$1,res=0}
    for i in `echo $name | sed -e 's/./& /g'`
    do
        tmp=`ord $i`
        let res=$res+$tmp
    done
    echo $res
}

i=1
for name in `echo $data`
do
    ans=0
    score_by_name=`score $name`
    final_score=`echo "$score_by_name * $i" | bc`
    let ans=$ans+$final_score
    let i=$i+1
done

echo $ans


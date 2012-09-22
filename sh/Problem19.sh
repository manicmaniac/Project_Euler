#!/bin/bash
#You are given the following information, but you may prefer to do some research
#for yourself.
#
#  • 1 Jan 1900 was a Monday.
#  • Thirty days has September,
#    April, June and November.
#    All the rest have thirty-one,
#    Saving February alone,
#    Which has twenty-eight, rain or shine.
#    And on leap years, twenty-nine.
#  • A leap year occurs on any year evenly divisible by 4, but not on a century
#    unless it is divisible by 400.
#
#How many Sundays fell on the first of the month during the twentieth century (1
#Jan 1901 to 31 Dec 2000)?

function day() {
    local {y=$1,m=$2,d=$3}
    echo `env LANG=C date --date=$y$m$d | cut -c -3`
}

ans=0
for year in {1901..2000}
do
    for month in `seq 12 | sed -e 's/\<.\>/0&/g'`
    do
        if [ `day $year $month 01` = 'Sun' ]; then
            let ans=$ans+1
        fi
    done
done
echo $ans


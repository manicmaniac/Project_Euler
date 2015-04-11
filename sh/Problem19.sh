#!/bin/sh

# You are given the following information, but you may prefer to do some research
# for yourself.
# 
#   • 1 Jan 1900 was a Monday.
#   • Thirty days has September,
#     April, June and November.
#     All the rest have thirty-one,
#     Saving February alone,
#     Which has twenty-eight, rain or shine.
#     And on leap years, twenty-nine.
#   • A leap year occurs on any year evenly divisible by 4, but not on a century
#     unless it is divisible by 400.
# 
# How many Sundays fell on the first of the month during the twentieth century (1
# Jan 1901 to 31 Dec 2000)?

# for i in $(seq 1901 2000)
# do
#     yes $i 2> /dev/null | head -n 12 | nl -nln | xargs -n2 cal | grep -e '^ 1'
# done | wc -l

i=1901
until [ $i -gt 2000 ];
do
    echo "1 $i 2 $i 3 $i 4 $i 5 $i 6 $i 7 $i 8 $i 9 $i 10 $i 11 $i 12 $i"
    i=$(($i + 1))
done | xargs -n 2 cal | grep -ce '^ 1'


#!/bin/bash
#An irrational decimal fraction is created by concatenating the positive
#integers:
#
#0.123456789101112131415161718192021...
#
#It can be seen that the 12^th digit of the fractional part is 1.
#
#If d[n] represents the n^th digit of the fractional part, find the value of the
#following expression.
#
#d[1] × d[10] × d[100] × d[1000] × d[10000] × d[100000] × d[1000000]

echo {0..1000000} | sed -e 's/\s//g' | cut -c 2,11,101,1001,10001,100001,1000001 | sed -e 's/./&*/g;s/\*$//' | bc


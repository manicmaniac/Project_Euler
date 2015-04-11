#!/bin/sh

# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# 
# What is the sum of the digits of the number 2^1000?

echo 2 ^ 1000 | bc | grep -o [0-9] | paste -sd+ - | bc


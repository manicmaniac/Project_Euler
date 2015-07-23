#!/usr/bin/env tclsh

# The sum of the squares of the first ten natural numbers is,
#
# 1^2 + 2^2 + ... + 10^2 = 385
#
# The square of the sum of the first ten natural numbers is,
#
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.

set square_of_sum 0
set sum_of_squares 0

for {set i 0} {$i <= 100} {incr i} {
    incr square_of_sum $i
    incr sum_of_squares [expr $i * $i]
}
set square_of_sum [expr $square_of_sum ** 2]

puts [expr $square_of_sum - $sum_of_squares]


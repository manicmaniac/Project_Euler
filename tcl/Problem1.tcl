#!/usr/bin/env tclsh

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

set acc 0
for {set i 0} {$i < 1000} {incr i} {
    if {!($i % 3 * $i % 5)} {
        incr acc $i
    }
}
puts $acc


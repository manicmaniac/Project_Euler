#!/usr/bin/env tclsh

# Each new term in the Fibonacci sequence is generated by adding the previous two
# terms. By starting with 1 and 2, the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose values do not exceed
# four million, find the sum of the even-valued terms.

package require math::constants
math::constants::constants phi

set sqrt5 [expr sqrt(5)]

proc fibterm {n} {
    global phi sqrt5
    return [expr round($phi ** ($n + 1) / $sqrt5)]
}

set acc 0
for {set i 2} {[set fib [fibterm $i]] < 4e6} {incr i 3} {
    incr acc $fib
}
puts $acc


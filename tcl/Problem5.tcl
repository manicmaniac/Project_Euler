#!/usr/bin/env tclsh

# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

proc tcl::mathfunc::gcd {x y} {
    return [expr $y ? gcd($y, $x % $y) : $x]
}

proc tcl::mathfunc::lcm {x y} {
    return [expr $x * $y / gcd($x, $y)]
}

set acc 1
for {set i 1} {$i <= 20} {incr i} {
    set acc [expr lcm($acc, $i)]
}
puts $acc


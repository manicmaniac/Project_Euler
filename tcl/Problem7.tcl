#!/usr/bin/env tclsh

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
# the 6th prime is 13.
#
# What is the 10 001st prime number?

proc is_prime {x} {
    if {$x == 2} {
        return true
    }
    if {$x < 2 || $x % 2 == 0} {
        return false
    }
    for {set i 3} {$i <= sqrt($x)} {incr i 2} {
        if {$x % $i == 0} {
            return false
        }
    }
    return true
}

for {set count 0; set i 0} {$count <= 1e4} {incr i} {
    if {[is_prime $i]} {
        incr count
    }
}
incr i -1
puts $i


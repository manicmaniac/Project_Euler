#!/usr/bin/env tclsh

# A palindromic number reads the same both ways. The largest palindrome made from
# the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

proc is_palidromic {x} {
    return [string equal $x [string reverse $x]]
}

proc is_3digits_product {x} {
    for {set i 100} {$i < sqrt($x) + 1} {incr i} {
        set d [expr $x / $i]
        set m [expr $x % $i]
        if {$m == 0 && $d < 1000} {
            return true
        }
    }
    return false
}

for {set i 998001} {$i > 10000} {incr i -1} {
    if {[is_palidromic $i] && [is_3digits_product $i]} {
        break
    }
}
puts $i


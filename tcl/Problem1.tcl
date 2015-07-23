#!/usr/bin/env tclsh

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

package require struct::list
package require lambda

puts [tcl::mathop::+ {*}[struct::list filter [struct::list iota 1000] [lambda {x} {expr $x % 3 * $x % 5 == 0}]]]



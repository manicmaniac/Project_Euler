#!/usr/bin/env perl
# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

use strict;
use warnings;

package Problem5;

sub gcd {
    my ($a, $b) = @_;
    return $b ? gcd($b, $a % $b) : $a;
}

sub lcm {
    my ($a, $b) = @_;
    return $a * $b / gcd($a, $b);
}


package main;

use List::Util qw/reduce/;

print(reduce { Problem5::lcm(our $a, our $b) } 1..20);


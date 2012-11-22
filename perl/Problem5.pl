#!/usr/bin/env perl -l
=pod
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
=cut

use strict;
use warnings;
use List::Util qw/reduce/;

sub gcd {
    my ($a, $b) = @_;
    return $b ? gcd($b, $a % $b) : $a;
}

sub lcm {
    my ($a, $b) = @_;
    return $a * $b / gcd($a, $b);
}

print reduce { our ($a, $b); lcm $a, $b } 1..20;


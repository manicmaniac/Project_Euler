#!/usr/bin/env perl -l
=pod
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=cut

use strict;
use warnings;
use List::Util qw/sum reduce/;

for my $m (1..23) {
    for my $n (1..$m) {
        my ($a, $b, $c) = ($m ** 2 - $n ** 2, 2 * $m * $n, $m ** 2 + $n ** 2);
        if (sum($a, $b, $c) == 1000) {
            print reduce { our ($a, $b); $a * $b } ($a, $b, $c);
            last;
        }
    }
}


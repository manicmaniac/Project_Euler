#!/usr/bin/env perl
# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:
#
# 012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5,
# 6, 7, 8 and 9?

use strict;
use warnings;

sub factorial {
    my $x = shift;

    my $acc = 1;
    for (; $x > 0; $x--) {
        $acc *= $x;
    }
    return $acc;
}

sub permutation_at {
    my $n = shift;
    my @xs = @_;

    return @xs if $#xs < 1;

    my $m = factorial($#xs);
    my $index = int($n / $m);
    my @ys = @xs;
    splice @ys, $index, 1;
    return ($xs[$index], permutation_at($n - $m * $index, @ys));
}

print permutation_at(999999, (0, 1, 2, 3, 4, 5, 6, 7, 8, 9));
print "\n";

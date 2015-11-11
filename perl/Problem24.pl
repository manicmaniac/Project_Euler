#!/usr/bin/env perl

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

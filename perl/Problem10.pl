#!/usr/bin/env perl

package Problem10;

use strict;
use warnings;
use constant {
    UNKNOWN => 0,
    NONPRIME => 1
};

sub sieve {
    my $limit = shift;
    if ($limit < 2) {
        return ();
    }
    my @search = (UNKNOWN) x $limit;
    $search[0] = NONPRIME;
    $search[1] = NONPRIME;

    my $sqrt_limit = sqrt($limit);
    for (my $current = 2; $current <= $sqrt_limit; $current++) {
        for (my $i = $current * 2; $i < $limit; $i += $current) {
            $search[$i] = NONPRIME;
        }
    }
    my @res;
    for (my $i = 0; $i < $limit; $i++) {
        if ($search[$i] == UNKNOWN) {
            push(@res, $i);
        }
    }
    return @res;
}

package main;

use strict;
use warnings;
use List::Util qw/sum/;

print(sum(Problem10::sieve(2e6)));


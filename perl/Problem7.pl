#!/usr/bin/env perl -l
=pod
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
the 6th prime is 13.

What is the 10 001st prime number?
=cut

use strict;
use warnings;

sub is_prime {
    my $n = $_[0];
    if ($n <= 2) {
        return $n == 2;
    };
    for my $i (2..$n - 1) {
        if (!($n % $i)) {
            return 0;
        }
    }
    return 1;
}

my ($count, $i) = (1, 1);
while ($count <= 1e4) {
    $i += 2;
    if (is_prime($i)) {
        $count ++;
    }
}

print $i;


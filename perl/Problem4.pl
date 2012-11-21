#!/usr/bin/env perl -l
=pod
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=cut

use strict;
use warnings;

sub is_palindrome {
    my ($str, $rev) = ($_[0]);
    $rev = reverse $str;
    return $str eq $rev;
}

sub is_3digit_product {
    for my $i (100..999) {
        if (!($_[0] % $i) && $_[0] / $i < 1e3) {
            return 1;
        }
    }
    return 0;
}

for my $i (grep { is_palindrome($_) && is_3digit_product($_) } reverse(1e4..998001)) {
    print $i;
    last;
}


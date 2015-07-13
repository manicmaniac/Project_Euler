#!/usr/bin/env perl
# A palindromic number reads the same both ways. The largest palindrome made from
# the product of two 2-digit numbers is 9009 = 91 × 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

use strict;
use warnings;

package Problem4;

sub is_palindrome {
    my ($str, $rev) = (shift, ());
    $rev = reverse $str;
    return $str eq $rev;
}

sub is_3digit_product {
    my $n = shift;
    for (100..999) {
        if (!($n % $_) && $n / $_ < 1e3) {
            return 1;
        }
    }
    return '';
}


package main;

for my $i (grep { Problem4::is_palindrome($_) && Problem4::is_3digit_product($_) } reverse(1e4..998001)) {
    print $i;
    last;
}


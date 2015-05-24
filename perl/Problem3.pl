#!/usr/bin/env perl
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

use strict;
use warnings;

sub factor {
    my ($n, $d, @res) = (shift, 2);
    while ($n >= $d) {
        unless ($n % $d) {
            push @res, $d;
            $n /= $d;
        }
        else {
            $d ++;
        }
    }
    return \@res;
}

print ${factor(600851475143)}[-1];


#!/usr/bin/env perl
# Three distinct points are plotted at random on a Cartesian plane, for which
# -1000 ≤ x, y ≤ 1000, such that a triangle is formed.
#
# Consider the following two triangles:
#
# A(-340,495), B(-153,-910), C(835,-947)
#
# X(-175,41), Y(-421,-714), Z(574,-645)
#
# It can be verified that triangle ABC contains the origin, whereas triangle XYZ
# does not.
#
# Using triangles.txt (right click and 'Save Link/Target As...'), a 27K text file
# containing the co-ordinates of one thousand "random" triangles, find the number
# of triangles for which the interior contains the origin.
#
# NOTE: The first two examples in the file represent the triangles in the example
# given above.

use strict;
use warnings;
use Math::Complex;

sub cross_product {
    my ($a, $b) = @_;
    return Re($a) * Im($b) - Re($b) * Im($a);
}

sub contains_origin {
    my ($a, $b, $c) = @_;
    my $p = cross_product($a, $b);
    my $q = cross_product($b, $c);
    my $r = cross_product($c, $a);
    return ($p < 0 and $q < 0 and $r < 0) || ($p >= 0 and $q >= 0 and $r >= 0);
}

my $count = 0;
open(my $fh, '<', '../resources/triangles.txt');
while (<$fh>) {
    my ($ax, $ay, $bx, $by, $cx, $cy) = split /,/;
    my $a = $ax + $ay * i;
    my $b = $bx + $by * i;
    my $c = $cx + $cy * i;
    $count++ if contains_origin($a, $b, $c);
}
close($fh);
print("$count\n");

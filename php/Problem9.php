<?php
/*
 * A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
 * a2 + b2 = c2
 * For example, 32 + 42 = 9 + 16 = 25 = 52.
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */

for ($m = 0; $m < 23; $m++) {
    for ($n = 0; $n < $m; $n++) {
        $a = $m * $m - $n * $n;
        $b = 2 * $m * $n;
        $c = $m * $m + $n * $n;
        if ($a + $b + $c == 1000) {
            echo $a * $b * $c;
            break;
        }
    }
}


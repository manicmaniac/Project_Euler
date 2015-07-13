<?php
/*
 * There are exactly ten ways of selecting three from five, 12345:
 *
 * 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
 *
 * In combinatorics, we use the notation, ^5C[3] = 10.
 *
 * In general,
 *
 * ^nC[r] = n!       ,where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
 *          r!(n−r)!
 *
 * It is not until n = 23, that a value exceeds one-million: ^23C[10] = 1144066.
 *
 * How many, not necessarily distinct, values of  ^nC[r], for 1 ≤ n ≤ 100, are
 * greater than one-million?
 */

function factorial($x) {
    return array_product(range(1, $x));
}

function c($n, $r) {
    return factorial($n) / (factorial($r) * factorial($n - $r));
}

$count = 0;
for ($n = 23; $n <= 100; $n++) {
    for ($r = 1; $r < $n; $r++) {
        $res = c($n, $r);
        if ($res > 1e6) {
            $count++;
        }
    }
}
echo $count;


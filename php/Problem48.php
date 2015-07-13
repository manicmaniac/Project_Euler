<?php
/*
 * The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 *
 * Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 */

echo array_sum(array_map(function($x) {
    return bcpowmod($x, $x, 1e10);
}, range(1, 1e3))) % 1e10;


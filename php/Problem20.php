<?php
/*
 * n! means n × (n − 1) × ... × 3 × 2 × 1
 *
 * For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 * and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
 *
 * Find the sum of the digits in the number 100!
 */

function bcfact($x) {
    return array_reduce(range(1, $x), function($x, $y) {
        return bcmul($x, $y);
    }, 1);
}

echo array_sum(str_split(bcfact(100)));


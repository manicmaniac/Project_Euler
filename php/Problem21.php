<?php
/*
 * Let d(n) be defined as the sum of proper divisors of n (numbers less than n
 * which divide evenly into n).
 * If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
 * each of a and b are called amicable numbers.
 *
 * For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
 * and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
 * 142; so d(284) = 220.
 *
 * Evaluate the sum of all the amicable numbers under 10000.
 */

function divisors($x) {
    $res = [1];
    for ($i = 2; $i <= sqrt($x); $i++) {
        if ($x % $i == 0) {
            $res[] = $i;
            $res[] = $x / $i;
        }
    }
    sort($res);
    return $res;
}

function hasAmicable($x) {
    $s = array_sum(divisors($x));
    return $s != $x and array_sum(divisors($s)) == $x;
}

echo array_sum(array_filter(range(2, 9999), 'hasAmicable'));


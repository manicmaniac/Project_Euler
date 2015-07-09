<?php
/*
 * The Fibonacci sequence is defined by the recurrence relation:
 *
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 *
 * It turns out that F[541], which contains 113 digits, is the first Fibonacci
 * number for which the last nine digits are 1-9 pandigital (contain all the
 * digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
 * digits, is the first Fibonacci number for which the first nine digits are 1-9
 * pandigital.
 *
 * Given that F[k] is the first Fibonacci number for which the first nine digits
 * AND the last nine digits are 1-9 pandigital, find k.
 */

define('LOG10_PHI', log10((1 + sqrt(5)) / 2));
define('LOG10_SQRT5', log10(5) / 2);

function upperFib($n) {
    $l = LOG10_PHI * ($n + 1) - LOG10_SQRT5;
    $l = fmod($l, 1);
    return (int)(pow(10, $l) * 1e8 + 0.5);
}

function lowerFibs() {
    list($i, $j) = [0, 1];
    while (true) {
        list($i, $j) = [$j, ($i + $j) % 1000000000];
        yield $i;
    }
}

function isPandigital($x) {
    if ($x % 9) {
        return false;
    }
    $flags = 0b0000000001;
    while ($x) {
        $d = $x % 10;
        $x /= 10;
        $flags |= 1 << $d;
    }
    return $flags == 0b1111111111;
}

foreach (lowerFibs() as $i => $lowerFib) {
    if (isPandigital($lowerFib) and isPandigital(upperFib($i))) {
        break;
    }
}
echo $i + 1;


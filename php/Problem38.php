<?php
/*
 * Take the number 192 and multiply it by each of 1, 2, and 3:
 *
 *     192 × 1 = 192
 *     192 × 2 = 384
 *     192 × 3 = 576
 *
 * By concatenating each product we get the 1 to 9 pandigital, 192384576. We will
 * call 192384576 the concatenated product of 192 and (1,2,3)
 *
 * The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and
 * 5, giving the pandigital, 918273645, which is the concatenated product of 9 and
 * (1,2,3,4,5).
 *
 * What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
 * concatenated product of an integer with (1,2, ... , n) where n > 1?
 */

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

function numberOfDigits($x) {
    if ($x) {
        return (int)(log10($x)) + 1;
    }
    return 1;
}

function concat($x, $y) {
    return ($x * pow(10, numberOfDigits($y))) + $y;
}

function concatToDigits($x, $digits) {
    $res = 0;
    for ($i = 0; numberOfDigits($res) < $digits; $i++) {
        $res = concat($res, $x * $i);
    }
    return $res;
}

function concatTo9Digits($x) {
    return concatToDigits($x, 9);
}


$limit = 9876;
$concateds = [];
for ($i = 1; $i <= $limit; $i++) {
    $concated = concatTo9Digits($i);
    if (isPandigital($concated) and numberOfDigits($concated) == 9) {
        $concateds[] = $concated;
    }
}
echo max($concateds);


<?php
/*
 * The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.
 *
 * Find the sum of all numbers, less than one million, which are palindromic in
 * base 10 and base 2.
 *
 * (Please note that the palindromic number, in either base, may not include
 * leading zeros.)
 */

function isPalindromic($x) {
    return $x == strrev($x);
}

$res = 0;
for ($i = 0; $i < 1e6; $i++) {
    if (isPalindromic($i) and isPalindromic(decbin($i))) {
        $res += $i;
    }
}
echo $res;


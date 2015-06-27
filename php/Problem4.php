<?php
/*
 * A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

function is_palindromic($x) {
    return $x == strrev($x);
}

function is_3digits_product($x) {
    for ($i = 100; $i <= sqrt($x); $i++) {
        $quot = $x / $i;
        $rem = $x % $i;
        if (!$rem && $quot < 1000) {
            return true;
        }
    }
    return false;
}

for ($i = 998001; $i >= 10000; $i--) {
    if (is_palindromic($i) && is_3digits_product($i)) {
        echo $i;
        break;
    }
}


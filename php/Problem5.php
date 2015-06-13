<?php
/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
 * What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
 */

function gcd($x, $y) {
    return ($y ? gcd($y, $x % $y) : $x);
}

function lcm($x, $y) {
    return $x * $y / gcd($x, $y);
}

echo array_reduce(range(2, 21), "lcm", 1);

?>


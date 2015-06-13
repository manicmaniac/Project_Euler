<?php
/*
 * By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
 * the 6th prime is 13.
 * 
 * What is the 10 001st prime number?
 */

function is_prime($x) {
    if ($x == 2) {
        return true;
    }
    if ($x < 2 || $x % 2 == 0) {
        return false;
    }
    $sqrt_x = sqrt($x);
    for ($i = 3; $i <= $sqrt_x; $i += 2) {
        if ($x % $i == 0) {
            return false;
        }
    }
    return true;
}

$count = 0;
for ($i = 0; $count <= 10000; $i++) {
    if (is_prime($i)) {
        $count++;
    }
}
echo $i - 1;

?>


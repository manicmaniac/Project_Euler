<?php
/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 * Find the sum of all the primes below two million.
 */

function sieve($limit) {
    if ($limit < 2) {
        return [];
    }
    $search = array_fill(2, $limit - 2, true);

    $sqrt_limit = sqrt($limit);
    for ($current = 2; $current <= $sqrt_limit; $current++) {
        for ($i = $current * 2; $i < $limit; $i += $current) {
            unset($search[$i]);
        }
    }
    return array_keys($search);
}

echo array_sum(sieve(2000000));

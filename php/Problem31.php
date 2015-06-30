<?php
/*
 * In England the currency is made up of pound, £, and pence, p, and there are
 * eight coins in general circulation:
 *
 *     1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
 *
 * It is possible to make £2 in the following way:
 *
 *     1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
 *
 * How many different ways can £2 be made using any number of coins?
 */

function currency($amount, $coins) {
    $cache = array_fill(0, $amount + 1, 0);
    $cache[0] = 1;
    foreach ($coins as $coin) {
        for ($i = $coin; $i <= $amount; $i++) {
            $cache[$i] += $cache[$i - $coin];
        }
    }
    return $cache[$amount];
}

$coins = [200, 100, 50, 20, 10, 5, 2, 1];
echo currency(200, $coins);


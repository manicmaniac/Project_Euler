<?php
/*
 * Starting in the top left corner of a 2×2 grid, and only being able to move to
 * the right and down, there are exactly 6 routes to the bottom right corner.
 *
 * [p015]
 *
 * How many such routes are there through a 20×20 grid?
 */

function factorial($x) {
    return array_product(range(1, $x));
}

function c($x, $y) {
    return array_product(range($y + 1, $x)) / factorial($y);
}

echo c(40, 20);


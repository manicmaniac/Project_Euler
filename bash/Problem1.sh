#!/bin/bash
:<<'###'
If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
###

tr \  + <<<`sort -nu <(seq 3 3 999; seq 5 5 999)` | bc


#!/bin/bash
:<<'###'
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
###

factor 600851475143 | rev | cut -f 1 -d\ | rev

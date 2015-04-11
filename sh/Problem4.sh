#!/bin/sh

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

rev() {
    (grep -o . | sed -e 's/.*/[&]/g' | tee /dev/stderr | wc -l | xargs -I% dc -e '[[n]pli1-si0li>L]sL%silLx') 2>&1 | dc
}


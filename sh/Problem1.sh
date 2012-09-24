#!/bin/bash
# -*- coding:utf-8 -*-
#If we list all the natural numbers below 10 that are multiples of 3 or 5, we
#get 3, 5, 6 and 9. The sum of these multiples is 23.
#
#Find the sum of all the multiples of 3 or 5 below 1000.

echo {3..999..3} {5..999..5} | sed -e 's/\s/\n/g' | sort -nu | paste -s | sed -e 's/\s/+/g' | bc


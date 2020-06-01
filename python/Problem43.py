# coding:utf-8
"""
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
"""

from itertools import permutations

def pandigital_digits():
    return permutations(range(10))

def has_substr_divisibility(digits):
    d1, d2, d3, d4, d5, d6, d7, d8, d9, d10 = digits
    return not (
        not d1
        or d4 & 1
        or (d3 + d4 + d5) % 3
        or d6 != 5
        or (d5 * 100 + d6 * 10 + d7) % 7
        or (d6 * 100 + d7 * 10 + d8) % 11
        or (d7 * 100 + d8 * 10 + d9) % 13
        or (d8 * 100 + d9 * 10 + d10) % 17
    )

def concat(digits):
    return int(''.join(map(str, digits)))

if __name__ == '__main__':
    print(sum(concat(digits) for digits in pandigital_digits() if has_substr_divisibility(digits)))

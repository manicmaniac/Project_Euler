# coding:utf-8
"""
Take the number 192 and multiply it by each of 1, 2, and 3:

    192 × 1 = 192
    192 × 2 = 384
    192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576. We will
call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and
5, giving the pandigital, 918273645, which is the concatenated product of 9 and
(1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?
"""

import math
import itertools


def is_pandigital(x):
    ''' check if `x` is 1-9 pandigital '''
    if x % 9:
        return False
    flags = 0b0000000001
    while x:
        x, d = divmod(x, 10)
        flags |= 1 << d
    return flags == 0b1111111111

def number_of_digits(x):
    if x:
        return int(math.log10(x)) + 1
    return 1

def concat(x, y):
    return (x * 10 ** number_of_digits(y)) + y

def concat_to_digits(x, digits):
    res = 0
    for i in itertools.count():
        res = concat(res, x * i)
        if number_of_digits(res) >= digits:
            break
    return res

def concat_to_9_digits(x):
    return concat_to_digits(x, 9)


if __name__ == '__main__':
    limit = 9876
    concats = itertools.imap(concat_to_9_digits, xrange(1, limit + 1))
    print max(i for i in concats if is_pandigital(i) and number_of_digits(i) == 9)


# coding:utf-8
"""
It is well known that if the square root of a natural number is not an integer,
then it is irrational. The decimal expansion of such square roots is infinite
without any repeating pattern at all.

The square root of two is 1.41421356237309504880..., and the digital sum of the
first one hundred decimal digits is 475.

For the first one hundred natural numbers, find the total of the digital sums
of the first one hundred decimal digits for all the irrational square roots.
"""

import decimal
import math


def sum_digits(x):
    return sum(map(int, str(x)))


if __name__ == '__main__':
    with decimal.localcontext() as context:
        context.prec = 102
        context.rounding = decimal.ROUND_DOWN
        result = 0
        _1e99 = 10 ** 99
        for i in range(100):
            if not math.sqrt(i).is_integer():
                result += sum_digits((context.sqrt(i) * _1e99).to_integral())
        print(result)

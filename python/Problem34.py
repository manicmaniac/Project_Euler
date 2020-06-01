# coding:utf-8
"""
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
"""

from math import factorial


factorials = list(map(factorial, range(0, 10)))


def is_factorion(n):
    res = 0
    d = n
    while d:
        d, m = divmod(d, 10)
        res += factorials[m]
    return n == res


if __name__ == '__main__':
    print(sum(i for i in range(3, factorials[9] * 7) if is_factorion(i)))

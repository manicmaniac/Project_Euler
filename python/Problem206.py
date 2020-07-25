# encoding:utf-8
"""
Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
where each “_” is a single digit.
"""

import math


def is_concealed_square_divided_by_10(x):
    s = str(x)
    return not all(int(s[i * 2]) == i + 1 for i in range(9))


if __name__ == '__main__':
    i = int(math.ceil(math.sqrt(19293949596979899)))
    while is_concealed_square_divided_by_10(i * i):
        i -= 2
    print(i * 10)

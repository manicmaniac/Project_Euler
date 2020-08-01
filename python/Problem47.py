# coding:utf-8
"""
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct prime factors
each. What is the first of these numbers?
"""

def count_distinct_factors(x):
    count = 0
    d = 2
    while x >= d:
        q, r = divmod(x, d)
        if r == 0:
            x = q
            while r == 0:
                q, r = divmod(x, d)
                x = q
            count += 1
        else:
            d += 1
    return count


if __name__ == '__main__':
    i = 1
    counter = 0
    while True:
        if count_distinct_factors(i) == 4:
            counter += 1
        else:
            counter = 0
        if counter == 4:
            break
        i += 1
    print(i - 3)

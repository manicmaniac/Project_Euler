# coding:utf-8
"""
It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.

9 = 7 + 212
15 = 7 + 222
21 = 3 + 232
25 = 7 + 232
27 = 19 + 222
33 = 31 + 212

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
"""

import itertools


def is_prime(x):
    if x == 2:
        return True
    if x < 2 or x % 2 == 0:
        return False
    limit = x ** 0.5
    d = 2
    while d <= limit:
        if x % d == 0:
            return False
        d += 1
    return True


def sieve(limit):
    search = bytearray([1] * limit)
    search[0] = 0
    search[1] = 0
    sqrt_limit = int(limit ** 0.5)
    for i in range(2, sqrt_limit):
        if search[i]:
            for j in range(i ** 2, limit, i):
                search[j] = 0
    return itertools.compress(range(limit), search)


def double_squares(limit):
    for i in itertools.count():
        res = 2 * i ** 2
        if res > limit:
            break
        yield res


def is_goldbach_composite(n):
    if is_prime(n):
        return True
    for prime in sieve(n):
        for ds in double_squares(n):
            if prime + ds == n:
                return True
    return False


if __name__ == '__main__':
    for i in itertools.count(5, 2):
        if not is_goldbach_composite(i):
            print(i)
            break

# coding:utf-8
"""
Euler discovered the remarkable quadratic formula:

$n^2 + n + 41$

It turns out that the formula will produce 40 primes for the consecutive
integer values $0 \le n \le 39$. However, when $n = 40, 40^2 + 40 + 41 = 40(40
+ 1) + 41$ is divisible by 41, and certainly when $n = 41, 41^2 + 41 + 41$ is
clearly divisible by 41.

The incredible formula $n^2 - 79n + 1601$ was discovered, which produces 80
primes for the consecutive values $0 \le n \le 79$. The product of the
coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

    $n^2 + an + b$, where $|a| < 1000$ and $|b| \le 1000$

    where $|n|$ is the modulus/absolute value of $n$
    e.g. $|11| = 11$ and $|-4| = 4$

Find the product of the coefficients, $a$ and $b$, for the quadratic expression
that produces the maximum number of primes for consecutive values of $n$,
starting with $n = 0$.
"""

import itertools


def is_prime(x):
    if x == 2:
        return True
    if x < 2 or x % 2 == 0:
        return False
    limit = int(x ** 0.5) + 1
    for i in range(3, limit):
        if x % i == 0:
            return False
    return True


def sieve(limit):
    search = bytearray([1] * limit)
    search[0] = 0
    search[1] = 0
    sqrt_limit = int(limit ** 0.5)
    for i in range(2, sqrt_limit):
        if search[i]:
            for j in range(i << 1, limit, i):
                search[j] = 0
    return itertools.compress(range(limit), search)


def count_quadratic_primes(a, b):
    count = 0
    for i in range(b):
        if is_prime(i * i + a * i + b):
            count += 1
        else:
            break
    return count


if __name__ == '__main__':
    longest = (0, 0)
    primes = list(sieve(1000))
    for a, b in itertools.product(range(-999, 1000, 2), primes):
        current = count_quadratic_primes(a, b)
        if longest[0] < current:
            longest = (current, a * b)
    print(longest[1])

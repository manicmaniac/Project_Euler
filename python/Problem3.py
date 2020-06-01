# coding:utf-8
"""
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
"""
import math
import fractions
import random
import functools


def lcg(n, c, x):
"""
    a pseudorandom number generator (known as Linear Congruential Generator)
"""
    return (x * x + c) % n


class memoize(object):
"""
    a decorator function class to memoize a expensive function.
"""
    def __init__(self, func):
        self._func = func
        self._cache = {}

    def __call__(self, *args):
        if self._cache.has_key(args):
            return self._cache[args]
        res = self._func(*args)
        self._cache[args] = res
        return res


@memoize
def is_prime(n, accuracy=20):
"""
    check if `n` is probable prime using Rabin Miller method.
    to get more reliability, increase `accuracy` parameter.
"""
    n = abs(n)
    if n == 2:
        return True
    if n == 1 or not n & 1:
        return False
    d = n - 1
    while not d & 1:
        d >>= 1
    for i in range(accuracy):
        a = random.randrange(n - 2) + 1
        t = d
        y = pow(a, t, n)
        while t != n - 1 and y != 1 and y != n - 1:
            y = (y * y) % n
            t <<= 1
        if y != n - 1 and not t & 1:
            return False
    return True


def trial_division(n):
"""
    find the smallest divisor of the integer `n` with Trial Division method.
    returns -1 if it is a prime.
"""
    limit = int(math.sqrt(n) + 1)
    for i in range(2, limit):
        if not n % i:
            return i
    return -1


def pollards_rho(n, c=1):
"""
    find the one of divisors of the composite number `n` with Pollard's Rho method.
    returns -1 if it is a prime.
    to get another result, change `c` parameter.
    warning: less reliable for small composite numbers.
"""
    x, y, d = 2, 2, 1
    f = functools.partial(lcg, n, c)
    while d == 1 and n:
        x = f(x)
        y = f(f(y))
        d = fractions.gcd(x - y, n)
        if d == n:
            return -1
    return d


@memoize
def factor(n, accuracy=10):
"""
    factorize the integer `n`.
    returns list of prime factors.
"""
    if is_prime(n):
        return [n]
    if n < 100:
        # fallbacks to trial division for a small integer
        divisor = trial_division(n)
    else:
        # `accuracy` is diverted to the constant of Pollard's Rho
        divisor = pollards_rho(n, accuracy)
    if divisor == -1:
        if accuracy:
            # repeat with another constant
            return factor(n, accuracy - 1)
        return [n]
    return factor(n / divisor) + factor(divisor)


if __name__ == '__main__':
    print(max(factor(600851475143)))


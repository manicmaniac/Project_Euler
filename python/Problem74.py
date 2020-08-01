# coding:utf-8
"""
The number 145 is well known for the property that the sum of the factorial of
its digits is equal to 145:

1! + 4! + 5! = 1 + 24 + 120 = 145

Perhaps less well known is 169, in that it produces the longest chain of
numbers that link back to 169; it turns out that there are only three such
loops that exist:

169 → 363601 → 1454 → 169
871 → 45361 → 871
872 → 45362 → 872

It is not difficult to prove that EVERY starting number will eventually get
stuck in a loop. For example,

69 → 363600 → 1454 → 169 → 363601 (→ 1454)
78 → 45360 → 871 → 45361 (→ 871)
540 → 145 (→ 145)

Starting with 69 produces a chain of five non-repeating terms, but the longest
non-repeating chain with a starting number below one million is sixty terms.

How many chains, with a starting number below one million, contain exactly
sixty non-repeating terms?
"""

from math import factorial


def memoize(f):
    cache = {}
    def inner(*args):
        if args in cache:
            return cache[args]
        result = f(*args)
        cache[args] = result
        return result
    return inner


def sum_digit_factorials(x):
    result = 0
    q = x
    while True:
        q, r = divmod(q, 10)
        result += factorial(r)
        if q < 1:
            break
    return result


@memoize
def sum_digit_factorials_chain_length(x):
    if x in (1, 2, 145, 40585):
        return 1
    if x in (871, 872, 45361, 45362):
        return 2
    if x in (169, 1454, 363601):
        return 3
    return 1 + sum_digit_factorials_chain_length(sum_digit_factorials(x))


if __name__ == '__main__':
    answer = len([i for i in range(1000000) if sum_digit_factorials_chain_length(i) == 60])
    print(answer)

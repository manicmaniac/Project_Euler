# coding:utf-8
"""
The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes
and concatenating them in any order the result will always be prime. For
example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four
primes, 792, represents the lowest sum for a set of four primes with this
property.

Find the lowest sum for a set of five primes for which any two primes
concatenate to produce another prime.
"""

import itertools
import math


def is_prime(x):
    if x == 2:
        return True
    if x < 2 or x % 2 == 0:
        return False
    limit = math.sqrt(x)
    d = 2
    while d <= limit:
        if x % d == 0:
            return False
        d += 1
    return True


def concatenate_int(x, y):
    return x * 10 ** (1 + int(math.log10(y))) + y


def is_concatenatable_primes(x, y):
    return is_prime(concatenate_int(x, y)) and is_prime(concatenate_int(y, x))


def find_group(common_group, trail, prime_groups, group_size):
    if len(trail) >= group_size:
        return trail
    result = []
    for i in common_group:
        result += find_group(common_group & prime_groups[i], trail + [i], prime_groups, group_size)
    return result



if __name__ == '__main__':
    group_size = 5
    prime_groups = {}
    try:
        for i in itertools.count(2):
            if is_prime(i):
                prime_groups[i] = set()
                for j in prime_groups:
                    if is_concatenatable_primes(i, j):
                        prime_groups[i].add(j)
                        if len(prime_groups[i]) >= group_size:
                            result = find_group(prime_groups[i], [i], prime_groups, group_size)
                            if result:
                                raise StopIteration(result)
    except StopIteration as e:
        print(sum(*e.args))

# coding:utf-8
"""
The number 3797 has an interesting property. Being prime itself, it is possible
to continuously remove digits from left to right, and remain prime at each
stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797,
379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to
right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
"""

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


def is_truncatable_prime(x):
    y = 0
    q, r = x, 0
    i = 0
    while q:
        if not is_prime(q):
            return False
        q, r = divmod(q, 10)
        y += r * (10 ** i)
        if not is_prime(y):
            return False
        i += 1
    return True


if __name__ == '__main__':
    sum = 0
    count = 0
    i = 11
    while count < 11:
        if is_truncatable_prime(i):
            sum += i
            count += 1
        i += 1
    print(sum)

# coding:utf-8
"""
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
"""

from math import sqrt

def divisors(n):
    res = [1]
    for i in range(2, int(sqrt(n)) + 1):
        if not n % i:
            res += [i, n / i]
    return sorted(res)

def has_amicable(n):
    s = sum(divisors(n))
    return s != n and sum(divisors(s)) == n

if __name__ == '__main__':
    print(sum(filter(has_amicable, range(2, 10000))))


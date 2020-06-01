"""
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
"""

from prime import isprime
from sympy import sieve
from itertools import islice

# sum(i for i in islice(sieve, 1, 547))

def f():
    for i in reversed(range(1, 547)):
        for j in range(1, 549-i):
            print j, i
            if isprime(sum(islice(sieve, j, i))):
                print j-i+1
                return sum(islice(sieve, j, i))

print f()

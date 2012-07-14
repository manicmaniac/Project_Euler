'''
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
'''

from prime import genprime, isprime

primelist = [i for i in genprime(3943)]
max_index = len(primelist) - 1

for i in reversed(range(max_index)):
    for j in range(max_index - i):
        print j, i

'''
for j in reversed(range(max_index)):
    for i in range(max_index - j):
        res = sum(primelist[i:j])
        if isprime(res):
            print res, j -i
'''

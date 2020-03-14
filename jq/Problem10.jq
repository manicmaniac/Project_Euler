# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

def sieve(upto):
  [limit(upto; repeat(true))] |
    .[0, 1] = false |
    . as $search |
    $search[range(2; upto | sqrt + 1) | select($search[.]) | range(. * .; upto; .)] = false |
    indices(true);

sieve(2e6) | add

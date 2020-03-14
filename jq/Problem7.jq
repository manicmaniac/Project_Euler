# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
# the 6th prime is 13.
# 
# What is the 10 001st prime number?

def is_prime:
  if . == 2 then
    true
  elif . < 2 or . % 2 == 0 then
    false
  else
    . as $x | all(range(3; . | sqrt + 1; 2); $x % . != 0)
  end;

nth(10000; recurse(. + 1) | select(is_prime))

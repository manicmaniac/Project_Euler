# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
# 
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

def gcd:
  if .[1] > 0 then
    [.[1], .[0] % .[1]] | gcd
  else
    .[0]
  end;

def lcm:
  .[0] * .[1] / gcd;

reduce range(1; 21) as $i (1; [., $i] | lcm)

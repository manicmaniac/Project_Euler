# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

def factor:
  last([., ., 2] | while(
    .[-1] < .[1];
      if .[1] % .[-1] == 0
      then
        [.[0], .[1] / .[-1], .[-1]] + .[2:]
      else
        .[-1] += 1
      end
    )
  )[1:-1];

600851475143 | factor | max

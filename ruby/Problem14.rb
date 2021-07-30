# The following iterative sequence is defined for the set of positive integers:
# 
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# 
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.

def max_cached_collatz(n)
  cache = {}
  longest = [0, 0]
  (1...n).step(2).each do |start|
    length = 1
    i = start
    while i > 1
      if i.even?
        i /= 2
      else
        i = 3 * i + 1
      end
      if cache[i]
        length += cache[i]
        break
      end
      length += 1
    end
    if longest[1] < length
      longest = [start, length]
    end
    cache[start] = length
  end
  longest
end

p max_cached_collatz(1000000)[0]

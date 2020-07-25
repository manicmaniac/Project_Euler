# It is possible to write ten as the sum of primes in exactly five different
# ways:
# 
# 7 + 3
# 5 + 5
# 5 + 3 + 2
# 3 + 3 + 2 + 2
# 2 + 2 + 2 + 2 + 2
# 
# What is the first value which can be written as the sum of primes in over five
# thousand different ways?

require 'prime'

def count_partitions_by_primes(amount)
  cache = {0 => 1}
  cache.default = 0
  Prime.each(amount) do |prime|
    prime.upto(amount) do |i|
      cache[i] += cache[i - prime]
    end
  end
  cache[amount]
end

puts (1..Float::INFINITY).lazy
  .find {|x| count_partitions_by_primes(x) > 5000}

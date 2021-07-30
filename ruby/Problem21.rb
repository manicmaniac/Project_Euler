# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.
# 
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.

def amicables(limit)
  numbers = Array.new(limit, 0)
  (1...limit).each do |i|
    ((i * 2)...limit).step(i) do |j|
      numbers[j] += i
    end
  end
  result = []
  numbers.each_with_index do |j, i|
    if j < limit && i == numbers[j] && i != j
      result << i
    end
  end
  result
end

p amicables(10000).sum

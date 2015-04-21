# The sum of the squares of the first ten natural numbers is,
# 
# 1^2 + 2^2 + ... + 10^2 = 385
# 
# The square of the sum of the first ten natural numbers is,
# 
# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# 
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 − 385 = 2640.
# 
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.

square_of_sum = (1..100).inject(:+) ** 2
sum_of_square = (1..100).map{|x| x ** 2}.inject(:+)

puts square_of_sum - sum_of_square


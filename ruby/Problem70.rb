# Euler's Totient function, φ(n) [sometimes called the phi function], is used to
# determine the number of positive numbers less than or equal to n which are
# relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than
# nine and relatively prime to nine, φ(9)=6.
# The number 1 is considered to be relatively prime to every positive number, so
# φ(1)=1.
# 
# Interestingly, φ(87109)=79180, and it can be seen that 87109 is a permutation
# of 79180.
# 
# Find the value of n, 1 < n < 10^7, for which φ(n) is a permutation of n and the
# ratio n/φ(n) produces a minimum.

require 'prime'

limit = Integer.sqrt(1e7) * 2
answer = Prime.each(limit).flat_map do |i|
  Prime.each(i).map do |j|
    n = i * j
    phi_n = (i - 1) * (j - 1)
    if n < 1e7 && (n.digits.sort == phi_n.digits.sort)
      [n, Float(n) / phi_n]
    end
  end.compact
end.min_by(&:last).first

puts(answer)

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def palindromic?(n)
  n.to_s == n.to_s.reverse
end

def is_3digits_product?(n)
  !! 100.upto(n ** 0.5).detect do |i|
    d, m = n.divmod(i)
    m.zero? && d < 1000
  end
end

answer = 998001.downto(10000).detect do |i|
  palindromic?(i) and is_3digits_product?(i)
end

puts(answer)

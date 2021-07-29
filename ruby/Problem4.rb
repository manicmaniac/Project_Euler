# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def palindromic?(x)
  x.to_s == x.to_s.reverse
end

def product_of_3digits?(x)
  !!(100..x ** 0.5).detect do |i|
    d, m = x.divmod(i)
    m.zero? && d < 1000
  end
end

p 998001
  .downto(10000)
  .detect { |i| palindromic?(i) && product_of_3digits?(i) }

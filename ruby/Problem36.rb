# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)

def parindromic?(x)
  s = x.to_s
  s == s.reverse
end

def binary_parindromic?(x)
  s = x.to_s(2)
  s == s.reverse
end

p (0..1000000)
  .select(&method(:parindromic?))
  .select(&method(:binary_parindromic?))
  .sum

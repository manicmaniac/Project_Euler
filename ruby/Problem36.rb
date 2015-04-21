# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)

result = (0..1000000).select do |x|
    s = x.to_s
    b = x.to_s(base=2)
    s == s.reverse and b == b.reverse
end

puts result.inject :+


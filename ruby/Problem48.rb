# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
# 
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

p (1..1000).sum { |x| x.pow(x, 1e10.to_i) } % 1e10.to_i

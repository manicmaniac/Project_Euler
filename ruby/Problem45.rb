# Triangle, pentagonal, and hexagonal numbers are generated by the following
# formulae:
#
# Triangle     T[n]=n(n+1)/2    1, 3, 6, 10, 15, ...
# Pentagonal   P[n]=n(3n−1)/2   1, 5, 12, 22, 35, ...
# Hexagonal    H[n]=n(2n−1)     1, 6, 15, 28, 45, ...
#
# It can be verified that T[285] = P[165] = H[143] = 40755.
#
# Find the next triangle number that is also pentagonal and hexagonal.

def pentagonal?(x)
  (((24 * x + 1) ** 0.5 + 1) / 6) % 1 == 0
end

hexagonals = Enumerator.new do |yielder|
  i = 0
  loop do
    yielder << i * (i * 2 - 1)
    i += 1
  end
end

p hexagonals
  .lazy
  .drop_while { |x| x <= 40755 }
  .detect(&method(:pentagonal?))

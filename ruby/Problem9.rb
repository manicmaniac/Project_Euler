# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

1.upto(22) do |m|
  1.upto(m) do |n|
    a, b, c = m * m - n * n, 2 * m * n, m * m + n * n
    puts a * b * c if a + b + c == 1000
  end
end

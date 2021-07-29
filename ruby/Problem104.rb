# The Fibonacci sequence is defined by the recurrence relation:
#
#     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
#
# It turns out that F[541], which contains 113 digits, is the first Fibonacci
# number for which the last nine digits are 1-9 pandigital (contain all the
# digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
# digits, is the first Fibonacci number for which the first nine digits are 1-9
# pandigital.
#
# Given that F[k] is the first Fibonacci number for which the first nine digits
# AND the last nine digits are 1-9 pandigital, find k.

LOG10_PHI = Math.log10((1 + 5 ** 0.5) / 2)
LOG10_SQRT5 = Math.log10(5) / 2

def upper_fib(n)
  l = (LOG10_PHI * (n + 1) - LOG10_SQRT5) % 1
  (10 ** l * 1e8).round
end

lower_fibs = Enumerator.new do |yielder|
  i, j = 0, 1
  loop do
    i, j = j, (i + j) % 1e9.to_i
    yielder << i
  end
end

def pandigital?(x)
  x % 9 == 0 && (x.digits << 0).uniq.size == 10
end

p lower_fibs
  .each_with_index
  .find { |lower_fib, i| pandigital?(lower_fib) && pandigital?(upper_fib(i)) }
  .last
  .succ

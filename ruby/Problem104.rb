#!/usr/bin/env ruby

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

LOG10_PHI = Math.log10((1 + Math.sqrt(5)) / 2)
LOG10_SQRT5 = Math.log10(5) / 2

def upper_fib(n)
  l = LOG10_PHI * n.succ - LOG10_SQRT5
  _, l = l.divmod(1)
  (10 ** l * 1e8).round
end

def lower_fibs
  n, i, j = 0, 0, 1
  loop do
    i, j = j, (i + j) % 1_000_000_000
    yield n, i
    n += 1
  end
end

def is_pandigital(x)
  return false unless (x % 9).zero?
  flags = 0b0000000001
  until x.zero?
    x, d = x.divmod(10)
    flags |= 1 << d
  end
  flags == 0b1111111111
end

result = lower_fibs do |i, lower_fib|
  break i.succ if is_pandigital(lower_fib) && is_pandigital(upper_fib(i))
end

puts(result)

# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

def factorial(n)
    n.downto(1).inject(:*) or 0
end

def curious?(n)
    n > 2 and n == n.to_s.split('').collect(&:to_i).collect(Proc.new factorial).inject(:+)
end

curious? 3


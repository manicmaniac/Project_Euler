=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
=end

puts((0..999).inject{|x, y| y % 3 * y % 5 == 0 ? x + y : x})


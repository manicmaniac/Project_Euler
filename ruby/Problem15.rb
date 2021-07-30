# Starting in the top left corner of a 2×2 grid, there are 6 routes (without
# backtracking) to the bottom right corner.
# 
# [p_015]
# 
# How many routes are there through a 20×20 grid?

def c(a, b)
  ((b + 1)..a).inject(:*) / (1..b).inject(:*)
end

p c(40, 20)

###
Starting in the top left corner of a 2×2 grid, there are 6 routes (without
backtracking) to the bottom right corner.

[p_015]

How many routes are there through a 20×20 grid?
###

c = (n, r) ->
	Math.floor([n...r].reduce((x, y) -> x * y) / [1..r].reduce((x, y) -> x * y))

console.log c(40, 20)


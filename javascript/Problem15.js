/*
 * Starting in the top left corner of a 2×2 grid, there are 6 routes (without
 * backtracking) to the bottom right corner.
 * 
 * [p_015]
 * 
 * How many routes are there through a 20×20 grid?
 */

function c(n, r) {
  return Array.from(Array(n - r), (_, i) => i + r + 1)
    .reduce((x, y) => x * y)
    / Array.from(Array(r), (_, i) => i + 1)
    .reduce((x, y) => x * y)
}

console.log(c(40, 20))

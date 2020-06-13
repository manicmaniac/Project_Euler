/*
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we
 * get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */

let answer = (0..<1000)
    .lazy
    .filter { $0.isMultiple(of: 3) || $0.isMultiple(of: 5) }
    .reduce(0, +)
print(answer)

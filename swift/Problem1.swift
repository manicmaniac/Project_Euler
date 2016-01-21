/*
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we
 * get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */

print((1..<1000).filter{(x: Int) in x % 3 * x % 5 == 0}.reduce(0, combine: +))

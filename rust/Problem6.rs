/*
 * The sum of the squares of the first ten natural numbers is,
 *
 * 12 + 22 + ... + 102 = 385
 * The square of the sum of the first ten natural numbers is,
 *
 * (1 + 2 + ... + 10)2 = 552 = 3025
 * Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.
 *
 * Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
 */
fn main() {
    let sum_of_squares = (0..101).fold(0, |x, y| x + y * y);
    let square_of_sums = ((0..101).fold(0, |x, y| x + y) as f64).powi(2) as i64;
    println!("{}", square_of_sums - sum_of_squares);
}

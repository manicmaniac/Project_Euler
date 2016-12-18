/*
 * Each new term in the Fibonacci sequence is generated by adding the previous two
 * terms. By starting with 1 and 2, the first 10 terms will be:
 *
 * 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 *
 * By considering the terms in the Fibonacci sequence whose values do not exceed
 * four million, find the sum of the even-valued terms.
 */
const SQRT_5: f64 = 2.2360679775;
const PHI: f64 = 1.61803398875;

fn fibterm(n: i32) -> i32 {
    return (PHI.powi(n + 1) / SQRT_5).round() as i32;
}

fn main() {
    let answer = (0..).map(fibterm)
                      .take_while(|&x| x < 4000000)
                      .filter(|x| x % 2 == 0)
                      .fold(0, |x, y| x + y);
    println!("{}", answer);
}

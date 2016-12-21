/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */
fn gcd(x: i64, y: i64) -> i64 {
    if y == 0 {
        x
    } else {
        gcd(y, x % y)
    }
}

fn lcm(x: i64, y: i64) -> i64 {
    x * y / gcd(x, y)
}

fn main() {
    println!("{}", (1..20).fold(1, lcm));
}

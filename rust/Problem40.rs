/*
 * An irrational decimal fraction is created by concatenating the positive
 * integers:
 *
 * 0.123456789101112131415161718192021...
 *
 * It can be seen that the 12^th digit of the fractional part is 1.
 *
 * If d[n] represents the n^th digit of the fractional part, find the value of the
 * following expression.
 *
 * d[1] × d[10] × d[100] × d[1000] × d[10000] × d[100000] × d[1000000]
 */

fn digit_at(x: i64, n: i64) -> i64 {
    let mut ndigits = 1;
    if x > 0 {
        ndigits = (x as f64).log10() as i64 + 1;
    }
    x / (10i64.pow((ndigits - n - 1) as u32) as i64) % 10
}

fn champernowne_at(n: i64) -> i64 {
    let mut ndigits = 1;
    let mut n = n - 1;
    let mut i = 1;
    while n >= ndigits {
        ndigits = (i as f64).log10() as i64 + 1;
        n -= ndigits;
        i += 1;
    }
    digit_at(i, n)
}

fn main() {
    let product: i64 = (0..6).map(|x| champernowne_at(10i64.pow(x))).product();
    println!("{}", product);
}

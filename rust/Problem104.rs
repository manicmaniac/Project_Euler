/* The Fibonacci sequence is defined by the recurrence relation:
 *
 *     F[n] = F[n−1] + F[n−2], where F[1] = 1 and F[2] = 1.
 *
 * It turns out that F[541], which contains 113 digits, is the first Fibonacci
 * number for which the last nine digits are 1-9 pandigital (contain all the
 * digits 1 to 9, but not necessarily in order). And F[2749], which contains 575
 * digits, is the first Fibonacci number for which the first nine digits are 1-9
 * pandigital.
 *
 * Given that F[k] is the first Fibonacci number for which the first nine digits
 * AND the last nine digits are 1-9 pandigital, find k.
 */

fn upper_fib(n: usize) -> i64 {
    let log10_phi = ((1f64 + 5f64.sqrt()) / 2f64).log10();
    let log10_sqrt5 = 5f64.log10() / 2f64;
    let x = (log10_phi * (n as f64 + 1f64) - log10_sqrt5).fract();
    (10f64.powf(x) * 1e8).round() as i64
}

struct LowerFibs { a: i64, b: i64 }

impl LowerFibs {
    fn new() -> LowerFibs {
        LowerFibs { a: 0, b: 1 }
    }
}

impl Iterator for LowerFibs {
    type Item = i64;

    fn next(&mut self) -> Option<i64> {
        let c = self.a;
        self.a = self.b;
        self.b = (self.b + c) % 1_000_000_000;
        Some(self.a)
    }
}

fn is_pandigital(x: i64) -> bool {
    assert!(x <= 999_999_999);
    if x % 9 != 0 {
        false
    } else {
        let mut flags = 1;
        let mut x = x;
        while x > 0 {
            flags |= 1 << (x % 10);
            x /= 10;
        }
        flags == 0b11_1111_1111
    }
}

fn main() {
    let lower_fibs = LowerFibs::new();
    let answer = lower_fibs.enumerate()
        .find(|&(i, x)| is_pandigital(x) && is_pandigital(upper_fib(i)))
        .unwrap()
        .0;
    println!("{}", answer);
}

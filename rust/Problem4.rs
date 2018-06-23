/*
 * A palindromic number reads the same both ways. The largest palindrome made from
 * the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

struct ReversedPalindromes { curr: i64 }

impl ReversedPalindromes {
    fn new(start: i64) -> ReversedPalindromes {
        ReversedPalindromes { curr: start }
    }

    fn reverse(x: i64, digits_count: u32) -> i64 {
        let mut x = x;
        let mut result = 0;
        for _ in 0..digits_count {
            result *= 10;
            result += x % 10;
            x /= 10;
        }
        result
    }
}

impl Iterator for ReversedPalindromes {
    type Item = i64;

    fn next(&mut self) -> Option<i64> {
        if self.curr <= 0 {
            None
        } else {
            let digits_count = (self.curr as f64).log10().ceil() as u32;
            let result = Some(self.curr * 10i64.pow(digits_count) + Self::reverse(self.curr, digits_count));
            self.curr -= 1;
            result
        }
    }
}

fn is_product_of_3digit_integers(x: i64) -> bool {
    let limit = (x as f64).sqrt().floor() as i64;
    for i in 100..limit {
        let m = x % i;
        if m == 0 {
            let d = x / i;
            if d < 1000 {
                return true;
            }
        }
    }
    false
}

fn main() {
    let mut palindromes = ReversedPalindromes::new(999);
    let answer = palindromes.find(|&x| is_product_of_3digit_integers(x)).unwrap();
    println!("{}", answer);
}

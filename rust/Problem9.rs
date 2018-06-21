/*
 * A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 *
 * a^2 + b^2 = c^2
 *
 * For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
 *
 * There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 * Find the product abc.
 */

struct PythagoreanTriplet { a: i64, b: i64, c: i64 }

impl PythagoreanTriplet {
    fn new(a: i64, b: i64, c: i64) -> PythagoreanTriplet {
        PythagoreanTriplet { a: a, b: b, c: c }
    }

    fn from(x: i64, y: i64) -> PythagoreanTriplet {
        PythagoreanTriplet::new(x * x - y * y, 2 * x * y, x * x + y * y)
    }

    fn sum(&self) -> i64 {
        self.a + self.b + self.c
    }

    fn product(&self) -> i64 {
        self.a * self.b * self.c
    }
}

fn main() {
    for i in 1.. {
        for j in 1..i {
            let triplet = PythagoreanTriplet::from(i, j);
            if triplet.sum() == 1000 {
                return println!("{}", triplet.product());
            }
        }
    }
}

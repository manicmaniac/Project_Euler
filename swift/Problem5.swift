/*
 * 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 * 
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 */

private extension BinaryInteger {
    func gcd(_ other: Self) -> Self {
        return other == 0 ? self : other.gcd(self % other)
    }

    func lcm(_ other: Self) -> Self {
        return self * other / gcd(other)
    }
}

print((1...20).reduce(1) { $0.lcm($1) })

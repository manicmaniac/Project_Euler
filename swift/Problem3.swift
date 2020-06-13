/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * 
 * What is the largest prime factor of the number 600851475143 ?
 */

func factorize<T: BinaryInteger>(_ x: T) -> Set<T> {
    var x = x
    var divisor: T = 2
    var result = Set<T>()
    while (x >= divisor) {
        if case (let quotient, 0) = x.quotientAndRemainder(dividingBy: divisor) {
            result.insert(divisor)
            x = quotient
        } else {
            divisor += 1
        }
    }
    return result
}

print(factorize(600851475143).max()!)

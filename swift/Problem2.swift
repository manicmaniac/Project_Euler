/*
 * Each new term in the Fibonacci sequence is generated by adding the previous two
 * terms. By starting with 1 and 2, the first 10 terms will be:
 *
 * 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 *
 * By considering the terms in the Fibonacci sequence whose values do not exceed
 * four million, find the sum of the even-valued terms.
 */

func fibonacciGenerator() -> AnyGenerator<Int> {
    var i = 0
    var j = 1
    return AnyGenerator<Int> {
        let k = i
        i = j
        j += k
        return i
    }
}

var sum = 0
for i in fibonacciGenerator() {
    guard i < 4000000 else {
        break
    }
    if i % 2 == 0 {
        sum += i
    }
}
print(sum)

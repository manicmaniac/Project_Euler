/*
 * The Fibonacci sequence is defined by the recurrence relation:
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

const LOG10_PHI = Math.log10((1 + 5 ** 0.5) / 2)
const LOG10_SQRT5 = Math.log10(5) / 2

function upperDigitsOfFibonacciAt(n) {
  const l = LOG10_PHI * (n + 1) - LOG10_SQRT5
  return Math.round(1e8 * 10 ** (l % 1))
}

function *generateLowerDigitsOfFibonaccies() {
  let i = 0
  let j = 1
  while (true) {
    const k = i
    i = j
    j = (j + k) % 1e10
    yield i
  }
}

function isPandigital(x) {
  if (x % 9) {
    return false
  }
  let flags = 0b0000000001
  while (x) {
    const d = x % 10
    x /= 10
    flags |= 1 << d
  }
  return flags == 0b1111111111
}

function *enumerate(generator, i = 0) {
  for (value of generator) {
    yield [i++, value]
  }
}

for (const [i, lowerDigits] of enumerate(generateLowerDigitsOfFibonaccies())) {
  if (isPandigital(lowerDigits) && isPandigital(upperDigitsOfFibonacciAt(i))) {
    console.log(i + 1)
    break
  }
}

/*
Euler published the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values
n = 0 to 39. However, when n = 40, 40^2 + 40 + 41 = 40(40 + 1) + 41 is
divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible
by 41.

Using computers, the incredible formula  n² − 79n + 1601 was discovered, which
produces 80 primes for the consecutive values n = 0 to 79. The product of the
coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

    n² + an + b, where |a| < 1000 and |b| < 1000

    where |n| is the modulus/absolute value of n
    e.g. |11| = 11 and |−4| = 4

Find the product of the coefficients, a and b, for the quadratic expression
that produces the maximum number of primes for consecutive values of n,
starting with n = 0.
*/
import scala.math.sqrt

object Problem27 {
  def isPrime(n:Int) = BigInt(n).isProbablePrime(10)

  def f(n:Int, a:Int, b:Int) = n*n+a*n+b

  def main(args:Array[String]) {
    val res = {
      for(a <- -999 to 999 by 2; b <- -999 to 999 by 2) yield {
        ((1 to 1000).map(f(_, a, b)).takeWhile(isPrime).length, a, b)
      }
    }.max
    print(res._2 * res._3)
  }
}

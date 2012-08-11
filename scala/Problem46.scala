/*
It was proposed by Christian Goldbach that every odd composite number can be
written as the sum of a prime and twice a square.

9 = 7 + 2×1^2
15 = 7 + 2×2^2
21 = 3 + 2×3^2
25 = 7 + 2×3^2
27 = 19 + 2×2^2
33 = 31 + 2×1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of a prime
and twice a square?
*/

object Problem46 {
  val primes = 2 #:: Stream.from(1).map(_ * 2 + 1).filter(BigInt(_).isProbablePrime(10))

  val squares = Stream.from(1).map(n => 2 * n * n)

  def isPrimeAndSquare(n:Int) = {
    primes.takeWhile(n>).flatMap(m => squares.takeWhile(n>).map(_ + m)).contains(n)
  }
  
  val oddComposites = {
    Stream.from(1).map(_ * 2 + 1).filterNot(BigInt(_).isProbablePrime(10))
  }

  def main(args:Array[String]) {
    print(oddComposites.dropWhile(isPrimeAndSquare).head)
  }
}

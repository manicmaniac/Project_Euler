/*
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13

This is the longest sum of consecutive primes that adds to a prime below
one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime,
contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most
consecutive primes?
*/

object Problem50 {
  val primes = 2 #:: Stream.from(1).map(_ * 2 + 1).filter(BigInt(_).isProbablePrime(10))

  def isPrime(n:Int) = BigInt(n) isProbablePrime 10

  def main(args:Array[String]) {
    println((546 to 1 by -1).flatMap(primes.take(546).sliding(_).map(_.sum).find(x => x<1e6 && isPrime(x))) max)
  }
}


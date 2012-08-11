/*
The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases
by 3330, is unusual in two ways: (i) each of the three terms are prime, and,
(ii) each of the 4-digit numbers are permutations of one another.

There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
exhibiting this property, but there is one other 4-digit increasing sequence.

What 12-digit number do you form by concatenating the three terms in this
sequence?
*/

object Problem49 {
  def isPrime(n:Int) = BigInt(n).isProbablePrime(10)

  val primes = 2 #:: Stream.from(1).map(_*2+1).filter(isPrime)

  def sameDigits(xs:Seq[Int]) = {
    xs.map(_.toString.map(_.asDigit).sorted).distinct.length == 1
  }

  def mkSeq(n:Int, d:Int) = List(n, n+d, n+d*2)

  def main(args:Array[String]) {
    val fourDigitPrimes = primes.dropWhile(999>).takeWhile(3333>).toList
    print(fourDigitPrimes.flatMap(x => (1000 to 3333 by 2).map(y => mkSeq(x, y))).filter(z => sameDigits(z) && z.forall(isPrime)).apply(1).mkString)
  }
}


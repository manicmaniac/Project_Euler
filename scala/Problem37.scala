/*
The number 3797 has an interesting property. Being prime itself, it is possible
to continuously remove digits from left to right, and remain prime at each
stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797,
379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from left to
right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/

object Problem37 {
  def trunc(n:Int) = {
    val s = n.toString
    (s.tails.toList.init ++ s.inits.toList.tail).filter(""!=).map(_.toInt)
  }

  def isPrime(n:Int) = BigInt(n).isProbablePrime(10)

  lazy val candidates = (9 to 999999 by 2).filter(x => (x.toString.head.asDigit, x.toString.last.asDigit) match {
      case _ if(x<100) => true
      case (0|2|4|6|8, _) => false
      case (_, 0|2|4|6|8) => false
      case _ => true
  })

  def main(args:Array[String]) {
    print(candidates.filter(trunc(_).forall(isPrime)).take(11).sum)
  }
}

/*
The number, 197, is called a circular prime because all rotations of the
digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
73, 79, and 97.

How many circular primes are there below one million?
*/

object Problem35 {
  def rotations(n:Int) = {
    n.toString.tails.toList.zip(n.toString.inits.toList.reverse).map(p => (p._1 ++ p._2).toInt).init
  }

  def isPrime(n:Int) = BigInt(n).isProbablePrime(10)

  val candidates = 2 ::  (3 to 1000000 by 2).toList.filter(_.toString.forall(_.toInt % 2 != 0))

  val circularPrimes = candidates.filter(rotations(_).forall(isPrime))

  def main(args:Array[String]) {
    print(circularPrimes.length)
  }
}

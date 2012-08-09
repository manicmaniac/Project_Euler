/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

object Problem10 {
  def from(n:Long):Stream[Long] = n #:: from(n+1)
  val primeCandidates = 2L #:: 3L #:: from(1).map(_*6-1).zip(from(1).map(_*6+1)).map(p => List(p._1, p._2)).flatten
  def main(args:Array[String]) {
    print(primeCandidates.filter(BigInt(_).isProbablePrime(10)).takeWhile(2000000>).sum)
  }
}

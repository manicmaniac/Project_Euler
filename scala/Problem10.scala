/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
*/

/*
object Problem10 {
  def count(n:Int):Stream[Int] = {
    Stream.cons(n, count(n + 1))
  }
  def genPrimes(xs:Stream[Int]):Stream[Int] = {
    Stream.cons(xs.head, genPrimes(xs.tail.filter(_ % xs.head != 0)))
  }
  def main(args:Array[String]) {
    lazy val primes:Stream[Int] = genPrimes(count(2))
    println(primes.takeWhile(_ < 10000).sum)
  }
}
*/

object Problem10 {
  lazy val prime_candidates:Stream[Long] = Stream(2L, 3L) #::: primeCandidates(1)

  def primeCandidates(n:Long):Stream[Long] = {
    Stream.cons(6*n-1, Stream.cons(6*n+1, primeCandidates(n+1)))
  }

  def main(args:Array[String]) {
    prime_candidates take 100 print
  }
}

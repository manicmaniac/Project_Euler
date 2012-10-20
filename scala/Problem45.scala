/*
Triangle, pentagonal, and hexagonal numbers are generated by the following
formulae:

Triangle     T[n]=n(n+1)/2    1, 3, 6, 10, 15, ...
Pentagonal   P[n]=n(3n−1)/2   1, 5, 12, 22, 35, ...
Hexagonal    H[n]=n(2n−1)     1, 6, 15, 28, 45, ...

It can be verified that T[285] = P[165] = H[143] = 40755.

Find the next triangle number that is also pentagonal and hexagonal.
*/

object Problem48 {
  def from(n:Long):Stream[Long] = {
    Stream.cons(n, from(n+1))
  }
  lazy val triangle:Stream[Long] = from(1L).map(p => p*(p+1)/2)
  lazy val pentagonal:Stream[Long] = from(1L).map(p => p*(3*p-1)/2)
  lazy val hexagonal:Stream[Long] = from(1L).map(p => p*(2*p-1))
  def main(args:Array[String]) {
    println(triangle.filter(p => pentagonal.takeWhile(_<=p).exists(_==p) && hexagonal.takeWhile(_<=p).exists(_==p))(2))
  }
}


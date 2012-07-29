/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

import scala.math.sqrt

object Problem7 {
  lazy val primes = {
    2 #:: Stream.from(2).filter(n => !((2::(3 to sqrt(n).toInt by 2).toList).exists(n%_==0)))
  }
  def main(args:Array[String]) {
  }
  println(primes(10000))
}


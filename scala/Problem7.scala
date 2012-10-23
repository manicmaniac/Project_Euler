/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

object Problem7 {
  lazy val primes = 2 #:: (Stream from 1 map(_ * 2 + 1) filter isPrime)

  def isPrime(n:Int) = BigInt(n) isProbablePrime 10

  def main(args:Array[String]) {
    println(primes(10000))
  }
}


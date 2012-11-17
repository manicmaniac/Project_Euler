/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

object Problem7 {
  def main(args:Array[String]) {
    println((Stream from 1 filter(BigInt(_) isProbablePrime 10))(10000))
  }
}


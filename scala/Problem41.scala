/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
also prime.

What is the largest n-digit pandigital prime that exists?
*/

object Problem41 {
  def pandigitals(digits:Int) = (1 to digits).permutations.toList.map(_.mkString.toInt)

  def isProbablePrime(n:Int) = BigInt(n).isProbablePrime(1)

  def main(args:Array[String]) {
    println(1 to 9 map(pandigitals) reduce(_++_) filter(isProbablePrime) max)
  }
}


/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
also prime.

What is the largest n-digit pandigital prime that exists?
*/
import scala.math.sqrt

object Problem41 {
  def pandigitals(digits:Int) = {
    (1 to digits).permutations.toList.map(_.mkString.toInt)
  }

  def isPrime(n:Int) = n match {
    case 1 => false
    case 2|3 => true
    case _ if(n%6!=1&&n%6!=5) => false
    case _ => !(2 to sqrt(n).toInt).exists(n%_==0)
  }

  def main(args:Array[String]) {
    println(1 to 9 map(pandigitals) reduce(_++_) filter(isPrime) max)
  }
}

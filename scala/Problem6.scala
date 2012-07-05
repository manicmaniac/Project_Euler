/*
The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025  385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/
import scala.math.pow

object Problem6 {
  def main(args:Array[String]) {
    println{
      {
        pow((for(i <- 1 to 100) yield i).sum, 2) - (for(i <- 1 to 100) yield pow(i , 2)).sum
      }.toLong
    }
  }
}

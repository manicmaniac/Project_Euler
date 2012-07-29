/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of
their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/

object Problem34 {
  def factorial(n:Int) = (1 to n).product
  def digits(n:Int) = n.toString.toList.map(_.toString.toInt)
  def isCurious(n:Int) = n == digits(n).map(factorial).sum
  def main(args:Array[String]) {
    println(((3 to 2540160).filter(isCurious)).sum)
  }
}

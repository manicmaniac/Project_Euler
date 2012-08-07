/*
n ! means  n    ( n    1)   ...   3   2   1
For example, 10! = 10   9   ...   3   2   1 = 3628800, and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
Find the sum of the digits in the number 100!
*/

object Problem20 {
  def fact(n:Int) = {
    (1 to n).map(p => BigInt(p)).product
  }
  def sumDigits(n:BigInt) = {
    n.toString.map(_.asDigit).sum
  }
  def main(args:Array[String]) {
    println(sumDigits(fact(100)))
  }
}


/*
n ! means  n    ( n    1)   ...   3   2   1
For example, 10! = 10   9   ...   3   2   1 = 3628800, and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
Find the sum of the digits in the number 100!
*/

object Problem20 {
  def main(args:Array[String]) {
    println((BigInt(1) to 100 product).toString.map(_.asDigit) sum)
  }
}


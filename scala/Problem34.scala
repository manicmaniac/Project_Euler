/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of
their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/

object Problem34 {
  def isCurious(n:Int) = n == n.toString.map(_.asDigit).map(1 to _ product).sum
  def main(args:Array[String]) {
    print((3 to 2540160).filter(isCurious) sum)
  }
}

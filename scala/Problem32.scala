/*
We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can
be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only
include it once in your sum.
*/

object Problem32 {
  val perms = (1 to 9).permutations.toList.map(_.mkString)
  def isThroughPandigital(string:String) = {
      string.slice(0, 1).toInt * string.slice(1, 5).toInt == string.slice(5, 9).toInt ||
      string.slice(0, 2).toInt * string.slice(2, 5).toInt == string.slice(5, 9).toInt
  }
  def main(args:Array[String]) {
    println(perms.filter(isThroughPandigital).map(_.slice(5, 9).toInt).distinct.sum)
  }
}

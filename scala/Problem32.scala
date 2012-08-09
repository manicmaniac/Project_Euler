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

  def isThroughPandigital(s:String) = {
      s.take(1).toInt * s.slice(1, 5).toInt == s.slice(5, 9).toInt ||
      s.take(2).toInt * s.slice(2, 5).toInt == s.slice(5, 9).toInt
  }

  def main(args:Array[String]) {
    print(perms.filter(isThroughPandigital).map(_.slice(5, 9).toInt).distinct.sum)
  }
}

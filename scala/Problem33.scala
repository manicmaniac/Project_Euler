/*
The fraction ^49/[98] is a curious fraction, as an inexperienced mathematician
in attempting to simplify it may incorrectly believe that ^49/[98] = ^4/[8],
which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, ^30/[50] = ^3/[5], to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than
one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms,
find the value of the denominator.
*/

object Problem33 {
// ij / jk
  def gcd(s:Double, t:Double):Int = BigInt(s.toInt).gcd(t.toInt).toInt
  val conditionalFractions = {
    for(i <- 1 to 9; j <- 1 to 9; k <- 1 to 9) yield {
      val denominator = (i.toString + j.toString).toDouble
      val numerator = (j.toString + k.toString).toDouble
      if((denominator < numerator) && (denominator / numerator == i.toDouble / k.toDouble)) {
        (denominator.toInt, numerator.toInt)
      }
    }
  }.filter(_!=()).asInstanceOf[Seq[(Int, Int)]]
  def main(args:Array[String]) {
    val n = conditionalFractions.unzip._1.product
    val d = conditionalFractions.unzip._2.product
    print(d / n)
  }
}

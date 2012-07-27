/*
A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^
100 is almost unimaginably large: one followed by two-hundred zeros. Despite
their size, the sum of the digits in each number is only 1.

Considering natural numbers of the form, a^b, where a, b < 100, what is the
maximum digital sum?
*/

object Problem56 {
  def main(args:Array[String]) {
    println((for(i <- BigInt(1) to BigInt(99); j <- 1 to 99) yield i.pow(j).toString.toList.map(_.toString.toInt).sum).max)
  }
}

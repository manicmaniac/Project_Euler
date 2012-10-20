/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

object Problem9 {
  def main(args:Array[String]) {
    println((1 to 23).flatMap(m => (1 to m).map(n => List(m*m-n*n, 2*m*n, m*m+n*n))).find(_.sum == 1000).get.product)
  }
}

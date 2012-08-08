/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

object Problem9 {
  def findPythagoreanTripret(sum:Long, m:Long=0, n:Long=0):List[Long] = m match {
    case _ if(m*m-n*n + 2*m*n + m*m+n*n == sum) => {
      List(m*m-n*n, 2*m*n, m*m+n*n)
    }
    case _ if(m <= n) => findPythagoreanTripret(sum, m+1, 0)
    case _ if(m > n) => findPythagoreanTripret(sum, m, n+1)
    case _ => Nil

  }
  def main(args:Array[String]) {
    print(findPythagoreanTripret(1000) product)
  }
}

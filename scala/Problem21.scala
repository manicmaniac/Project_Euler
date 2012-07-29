/*
Let d(n) be defined as the sum of proper divisors of n (numbers less than n
which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/

object Problem21 {
  def divisors(n:Int, d:Int=1, res:List[Int]=Nil):List[Int] = d match {
    case `n` => res.reverse
    case _ if(n%d==0) => divisors(n, d+1, d::res)
    case _ => divisors(n, d+1, res)
  }

  def main(args:Array[String]) {
    val list = (1 to 10000).zip((1 to 10000).map(divisors(_).sum))
      println(list.intersect((list.map(p => (p._2, p._1)))).filter(p => p._1 != p._2).map(p => p._1 + p._2).sum/2)
  }
}

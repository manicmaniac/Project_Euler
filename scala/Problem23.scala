/*
A perfect number is a number for which the sum of its proper divisors is
exactly equal to the number. For example, the sum of the proper divisors of 28
would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n
and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
number that can be written as the sum of two abundant numbers is 24. By
mathematical analysis, it can be shown that all integers greater than 28123 can
be written as the sum of two abundant numbers. However, this upper limit cannot
be reduced any further by analysis even though it is known that the greatest
number that cannot be expressed as the sum of two abundant numbers is less than
this limit.

Find the sum of all the positive integers which cannot be written as the sum of
two abundant numbers.
*/

object Problem23 {
  //val max = 28123
  val max = 9812
  def divisors(n:Int, d:Int=1, res:List[Int]=Nil):List[Int] = d match {
    case `n` => res.reverse
    case _ if(n%d==0) => divisors(n, d+1, d::res)
    case _ => divisors(n, d+1, res)
  }
  def isAbundant(n:Int) = n < divisors(n).sum
  val abundants = (1 to max).filter(isAbundant).toList.reverse
  def isSumOf2Abundants(n:Int, l:List[Int]=abundants):Boolean = l match {
    case Nil => false
    case _ if(l.dropWhile(_>n).contains(n - l.head)) => true
    case _ => isSumOf2Abundants(n, l.tail)
  }

  def main(args:Array[String]) {
    println((1 to max).filter(isSumOf2Abundants(_, abundants)))
  }
}


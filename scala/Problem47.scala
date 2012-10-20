/*
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 × 7
15 = 3 × 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2² × 7 × 23
645 = 3 × 5 × 43
646 = 2 × 17 × 19.

Find the first four consecutive integers to have four distinct primes factors.
What is the first of these numbers?
*/

object Problem47 {
  def factorize(n:Int, d:Int=2, res:List[Int]=Nil):List[Int] = d match {
    case _ if(n<2) => 1::res
    case `n` => d::res
    case _ if(n%d==0) => factorize(n/d, d, d::res)
    case _ => factorize(n, d+1, res)
  }
  def findConditional(n:Int, i:Int=1):Int = {
    if((i to (i+n-1)).map(factorize(_).distinct.length).forall(_==n)) i
    else findConditional(n, i+1)
  }
  def main(args:Array[String]) {
    println(findConditional(4))
  }
}


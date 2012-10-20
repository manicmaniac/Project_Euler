/*
A number chain is created by continuously adding the square of the digits in a
number to form a new number until it has been seen before.

For example,

44 → 32 → 13 → 10 → 1 → 1
85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

Therefore any chain that arrives at 1 or 89 will become stuck in an endless
loop. What is most amazing is that EVERY starting number will eventually arrive
at 1 or 89.

How many starting numbers below ten million will arrive at 89?
*/
import scala.math.pow
object Problem92 {
  def chain(n:Int, res:List[Int]=Nil):List[Int] = {
    if(res.contains(n)) n::res
    else chain(n.toString.map(n => pow(n.asDigit, 2)).sum.toInt, n::res)
  }
  def isChainLast89(n:Int):Boolean = n match {
    case 1 => false
    case 89 => true
    case _ => isChainLast89(n.toString.toList.map(n => pow(n.toString.toInt, 2)).sum.toInt)
  }
  def main(args:Array[String]) {
    println((1 to 9999999 filter(isChainLast89)).length)
  }
}


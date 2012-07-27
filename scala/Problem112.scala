/*
Working from left-to-right if no digit is exceeded by the digit to its left it
is called an increasing number; for example, 134468.

Similarly if no digit is exceeded by the digit to its right it is called a
decreasing number; for example, 66420.

We shall call a positive integer that is neither increasing nor decreasing a
"bouncy" number; for example, 155349.

Clearly there cannot be any bouncy numbers below one-hundred, but just over
half of the numbers below one-thousand (525) are bouncy. In fact, the least
number for which the proportion of bouncy numbers first reaches 50% is 538.

Surprisingly, bouncy numbers become more and more common and by the time we
reach 21780 the proportion of bouncy numbers is equal to 90%.

Find the least number for which the proportion of bouncy numbers is exactly
99%.
*/

object Problem112 {
  def isIncreasing(n:Int) = {
    val digits = n.toString.toList.map(_.toString.toInt)
    def check(l:List[Int], p:Int=0):Boolean = p match {
      case _ if(l.isEmpty) => true
      case _ if(l.head < p) => false
      case _ if(l.head > p) => check(l.tail, l.head)
      case _ => true
    }
    check(digits)
  }
  def isDecreasing(n:Int) = {
    val digits = n.toString.toList.map(_.toString.toInt)
    def check(l:List[Int], p:Int=9):Boolean = p match {
      case _ if(l.isEmpty) => true
      case _ if(l.head > p) => false
      case _ if(l.head < p) => check(l.tail, l.head)
      case _ => true
    }
    check(digits)
  }
  def isBouncy(n:Int) = n match {
    case _ if(isIncreasing(n) || isDecreasing(n)) => false
    case _ => true
  }
  def bouncity(n:Int) = {
    (1 to n).filter(isBouncy).length / n.toDouble
  }
  def main(args:Array[String]) {
    println(bouncity(21780))
  }
}

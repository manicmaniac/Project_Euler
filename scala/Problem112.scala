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
  def digitize(n:Int) = n.toString.map(_.asDigit)

  def isIncreasing(n:Int) = {
    val d = digitize(n)
    d == d.sorted
  }

  def isDecreasing(n:Int) = {
    val d = digitize(n)
    d == d.sorted.reverse
  }

  def isBouncy(n:Int) = {
    !isIncreasing(n) && !isDecreasing(n)
  }

  def main(args:Array[String]) {
    var bouncies:Double = 0
    var i = 1
    while(bouncies / i < 0.99) {
      i += 1
      if(isBouncy(i)) bouncies += 1
    }
    println(i)
  }
}

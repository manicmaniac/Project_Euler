//If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//Find the sum of all the multiples of 3 or 5 below 1000.

object Problem1 {
  def fizzbuzz(max:Int):IndexedSeq[Int] = {
    return (for(i <- 1 until max if((i % 3) * (i % 5) == 0)) yield i)
    }
  def main(args:Array[String]) {
    println((for(i <- fizzbuzz(1000)) yield i).sum)
  }
}

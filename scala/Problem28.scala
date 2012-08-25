/*
Starting with the number 1 and moving to the right in a clockwise direction a 5
by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed
in the same way?
*/

object Problem28 {
  //1,3,5,7,9,13,17,21,25,31,37,43,49,57,65,73,81
  def cycle(stream:Stream[Int]):Stream[Int] = {
    stream #::: cycle(stream.map(_+2))
  }
  val tmp:Stream[Int] = {
    Stream(2, 2, 2, 2) #::: tmp.map(_+2)
  }
  val diagons:Stream[Int] = {
    1 #:: cycle((1 to 4).toStream).zip(tmp).map(p => p._1 * p._2 + 1)
  }
  def main(args:Array[String]) {
    print(diagons.takeWhile(_<=1001*1001).sum)
  }
}

/*
An irrational decimal fraction is created by concatenating the positive
integers:

0.123456789101112131415161718192021...

It can be seen that the 12^th digit of the fractional part is 1.

If d[n] represents the n^th digit of the fractional part, find the value of the
following expression.

d[1] × d[10] × d[100] × d[1000] × d[10000] × d[100000] × d[1000000]
*/

object Problem40 {
  val concat_ints = Stream.from(0).take(185186).mkString
  def d(n:Int) = concat_ints.charAt(n).toInt-48
  def main(args:Array[String]) {
    println(d(1) * d(10) * d(100) * d(1000) * d(10000) * d(100000) * d(1000000))
  }
}


/*
It can be seen that the number, 125874, and its double, 251748, contain exactly
the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
contain the same digits.
*/

object Problem52 {
  def digits(n:Int) = {
    n.toString.toList.map(-48+).sorted
  }

  def hasSameDigits(n:Int) = {
    (1 to 6).map(x => digits(n*x)).distinct.length == 1
  }

  def main(args:Array[String]) {
    print(Stream.from(1).find(hasSameDigits).get)
  }
}

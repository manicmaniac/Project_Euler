/*
Starting in the top left corner of a 2×2 grid, there are 6 routes (without
backtracking) to the bottom right corner.

[p_015]

How many routes are there through a 20×20 grid?
*/

object Problem15 {
  def fact(n:BigInt) = (BigInt(1) to n).product

  def c(m:BigInt, n:BigInt) = (fact(m) / fact(n)) / fact(n)

  def main(args:Array[String]) {
    print(c(40, 20))
  }
}

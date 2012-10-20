/*
It is possible to write five as a sum in exactly six different ways:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two
positive integers?
*/

object Problem76 {
  def partition(k:Long, n:Long):Long = {
    if(k > n) 0
    else if(k == n) 1
    else partition(k + 1, n) + partition(k, n - k)
  }
  def main(args:Array[String]) {
    println(partition(1L, 100L) - 1)
  }
}


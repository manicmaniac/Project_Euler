/*
The following iterative sequence is defined for the set of positive integers:
n     n /2 ( n  is even)
n    3 n  + 1 ( n  is odd)
Using the rule above and starting with 13, we generate the following sequence:
13   40   20   10   5   16   8   4   2   1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
Which starting number, under one million, produces the longest chain?
NOTE:  Once the chain starts the terms are allowed to go above one million.
*/

object Problem14 {
  def collatz(n:Long, length:Long=0):Long = n match {
    case 1 => length+1
    case _ if(n % 2 == 0) => collatz(n/2, length+1)
    case _ if(n % 2 != 0) => collatz(3*n+1, length+1)
    case _ => 0
  }
  def main(args:Array[String]) {
    val list = (1 to 1000000).map(collatz(_, 0)).toList
    println(list.indexOf(list.max) + 1)
  }
}


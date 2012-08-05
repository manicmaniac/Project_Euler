/*
The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
number, 134217728=8^9, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
*/

object Problem63 {
  def main(args:Array[String]) {
    print((for(i <- BigInt(1) to 9; j <- 1 to 21; if(i.pow(j).toString.length == j)) yield i.pow(j)).length)
  }
}

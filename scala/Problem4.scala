/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

object Problem4 {
  def isPalindrome(n:Int) = {
    val s = n.toString
    s == s.reverse
  }
  def main(args:Array[String]) {
    println{
      {for(i <- 100 to 999;
        j <- 100 to 999;
        if(isPalindrome(i * j))) yield {i * j}}.max
    }
  }
}

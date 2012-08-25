/*
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

object Problem4 {
  def main(args:Array[String]) {
    print(998001 to 10000 by -1 find(n => n.toString==n.toString.reverse && (100 to 999 exists(x => n%x==0 && n/x<1000))) get)
  }
}

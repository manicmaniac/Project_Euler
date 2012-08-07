/*
The decimal number, 585 = 1001001001[2] (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in
base 10 and base 2.

(Please note that the palindromic number, in either base, may not include
leading zeros.)
*/

object Problem36 {
  def isPalindromic(n:String) = n == n.reverse

  def main(args:Array[String]) {
    print((1 to 999999).filter(n => isPalindromic(n.toString) && isPalindromic(Integer.toBinaryString(n))).sum)
  }
}

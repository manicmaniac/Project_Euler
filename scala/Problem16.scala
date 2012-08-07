/*
2 15  = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2 1000 ?
*/

object Problem16 {
  def pow(base:BigInt, n:Int, res:BigInt=1):BigInt = n match {
    case 0 => res
    case _ if(n<0) => 0
    case _ => pow(base, n-1, res*base)
  }
  def sumDigits(n:BigInt) = {
    n.toString.map(_.asDigit).sum
  }
  def main(args:Array[String]) {
    print(sumDigits(pow(2,1000)))
  }
}


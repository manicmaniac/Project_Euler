/*
Take the number 192 and multiply it by each of 1, 2, and 3:

    192 × 1 = 192
    192 × 2 = 384
    192 × 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576. We will
call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and
5, giving the pandigital, 918273645, which is the concatenated product of 9 and
(1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be formed as the
concatenated product of an integer with (1,2, ... , n) where n > 1?
*/

object Problem38 {
  def isPandigital(n:Long) = n.toString.sorted == "123456789"

  def concatProduct(n:Int, i:Int=1, res:Long=0):Long = res.toString.length match {
    case 9 => res
    case x if(x>9) => 0L
    case x => concatProduct(n, i + 1, (res.toString + (n * i).toString).toLong)
  }

  def main(args:Array[String]) {
    println((1 to 9876).map(concatProduct(_, 1, 0)).filter(isPandigital) max)
  }
}


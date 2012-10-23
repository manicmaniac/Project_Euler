/*
By replacing the 1^st digit of *3, it turns out that six of the nine possible
values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3^rd and 4^th digits of 56**3 with the same digit, this
5-digit number is the first example having seven primes among the ten generated
numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and
56993. Consequently 56003, being the first member of this family, is the
smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not necessarily
adjacent digits) with the same digit, is part of an eight prime value family.
*/

object Problem51 {
  def isPrime(n:Int) = BigInt(n) isProbablePrime 10

  val primes = Stream.from(1).map(_ * 2 + 1).filter(isPrime)

  def digitize(n:Int) = n.toString.map(_ asDigit)

  def replaseDigitIsPrime(digits:Seq[Int], n:Int):Int = {
    val d = digits.mkString
    (n to 9).count(x => isPrime(d.replace(n.toString, x.toString).toInt))
  }

  def hasReplacableDigits(digits:Seq[Int]):Int = digits.init match {
    case Nil => 0
    case d if(d.min > 2) => 0
    case d if(d.count(2 ==) > 1) => replaseDigitIsPrime(digits, 2)
    case d if(d.count(1 ==) > 1) => replaseDigitIsPrime(digits, 1)
    case d if(d.count(0 ==) > 1) => replaseDigitIsPrime(digits, 0)
    case _ => 0
  }

  def main(args:Array[String]) {
    println(primes.map(digitize).find(hasReplacableDigits(_) > 7).get.mkString.toInt)
  }
}


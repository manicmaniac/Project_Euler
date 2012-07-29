//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

object Problem5 {
  def gcd(m:Long, n:Long):Long = n match {
    case 0 => m
    case _ if(m < n) => gcd(n, m)
    case _ => gcd(n, m % n)
  }
  def lcm(m:Long, n:Long) = m * n / gcd(m, n)
  def main(args:Array[String]) {
    print(1L to 20 reduce lcm)
  }
}

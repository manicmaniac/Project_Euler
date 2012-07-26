/*
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

object Problem3 {
  def factorize(n:Long, d:Long=2, res:List[Long]=Nil):List[Long] = n match {
    case `d` => d::res reverse
    case _ if(n % d == 0) => factorize(n/d, d, d::res)
    case _ => factorize(n, d+1, res)
  }
  def main(args:Array[String]) {
    println(factorize(600851475143L).max)
  }
}


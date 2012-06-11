//The prime factors of 13195 are 5, 7, 13 and 29.
//What is the largest prime factor of the number 600851475143 ?

object Problem3 {
  def factorize(num:Long, div:Long = 2, res:List[Long] = Nil):List[Long] = {
    if(num < 2) res.reverse
    else {
      if(num % div == 0) factorize(num / div, div, div :: res)
      else factorize(num, div + 1, res)
    }
  }
  def main(args:Array[String]) {
    println(factorize(600851475143L).max)
  }
}

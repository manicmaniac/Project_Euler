/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
*/

object Problem7 {
  def isPrime(num:Int, div:Int = 2):Boolean = {
    if(num < 2) false
    else {
      if(div * div >= num + 1) true
      else {
        if(num % div == 0) false
        else isPrime(num, div + 1)
      }
    }
  }
  def genPrime(max:Int, num:Int = 1, count:Int = 1, res:Int = 2):Int = {
    if(count > max) res
    else {
      if(isPrime(num)) {
        genPrime(max, num + 1, count + 1, num)
      }
      else {
        genPrime(max, num + 1, count, res)
      }
    }
  }
  def main(args:Array[String]) {
    println(genPrime(10001))
  }
}


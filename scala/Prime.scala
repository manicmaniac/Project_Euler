object Prime {
  def isPrime(num:Int):Boolean = {
    if(num == 2) true
    else {
      if(num % 2 == 0) false
      else {
        for(i <- 3 until num / 2 by 2) yield {
          if(num % i == 0) {return false}
        }
        true
      }
    }
  }
  def gen(max:Int) = {
    for(i <- 2 to max if(isPrime(i))) yield i
  }
  def factorize(num:Int) = {
    def f = for(i <- gen(num / 2)) yield {if(num % i == 0){i}}
    f.filter(_ != 0)
  }
  def main(args:Array[String]) {
    println(isPrime(2))
    println(gen(1000))
    println(factorize(100))
  }
}

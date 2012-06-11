//2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

object Problem5 {
  def factorize(num:Int, div:Int = 2, res:List[Int] = Nil):List[Int] = {
    if(num < 2 || num < div) res.reverse
    else {
      if(num % div == 0) factorize(num / div, div, div :: res)
      else factorize(num, div + 1, res)
    }
  }
  def solution(lst:List[Int], seq:Int = 0, acc:List[Int] = Nil):List[Int] = {
    if(lst.length <= seq) acc
    else {
      solution(lst, seq + 1, (factorize(lst(seq)) diff acc) ::: acc)
    }
  }
  def main(args:Array[String]) {
    println(solution((1 to 20).toList).fold(1){_ * _})
  }
}


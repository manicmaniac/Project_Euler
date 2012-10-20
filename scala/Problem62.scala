/*
The cube, 41063625 (345^3), can be permuted to produce two other cubes:
56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube
which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are
cube.
*/

object Problem62 {
  def cube(n:Long) = n * n * n

  def digits(n:Long) = {
    n.toString.map(_.asDigit).sorted
  }

  def filterAnagram(xs:Seq[Long], res:List[(Int, Long)]=Nil):List[(Int, Long)] = {
    xs match {
      case Nil => res
      case _ if(xs.tail.map(digits).contains(digits(xs.head))) => {
        filterAnagram(xs.tail, (xs.tail.map(digits).count(digits(xs.head)==), xs.head) :: res)
      }
      case _ => filterAnagram(xs.tail, res)
    }
  }

  def main(args:Array[String]) {
    println(filterAnagram((1L to 9999).map(cube)).filter(_._1 == 4).min._2)
  }
}


/*
If p is the perimeter of a right angle triangle with integral length sides, {a,
b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p ≤ 1000, is the number of solutions maximised?
*/

object Problem39 {
  def findPytagorean(perimeter:Int) = {
    (1 to perimeter-1).flatMap(a => (1 to a).map(b => List(b, a, math.sqrt(a*a+b*b))).filter(_.sum == perimeter))
  }
  def main(args:Array[String]) {
    println((1 to 1000).map(n => (findPytagorean(n).length, n)).max._2)
  }
}


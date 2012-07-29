/*
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
containing over five-thousand first names, begin by sorting it into
alphabetical order. Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name
score.

For example, when the list is sorted into alphabetical order, COLIN, which is
worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
*/
import scala.io.Source

object Problem22 {
  val FILE = "./names.txt"
  def input(file:String) = {
    val source = Source.fromFile(file)
    source.mkString.replace("\"", "").split(",").toList.sorted
  }
  def nameScore(name:String) = {
    name.map(_.toInt - 64).sum
  }
  def main(args:Array[String]) {
    println((((input(FILE).map(nameScore)).zip(1 to input(FILE).length)).map(p => p._1 * p._2)).sum)
  }
}

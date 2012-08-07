/*
The n^th term of the sequence of triangle numbers is given by, t[n] = ½n(n+1);
so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its
alphabetical position and adding these values we form a word value. For
example, the word value for SKY is 19 + 11 + 25 = 55 = t[10]. If the word value
is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file
containing nearly two-thousand common English words, how many are triangle
words?
*/
import scala.io.Source

object Problem42 {
  val FILE = "./words.txt"

  val triangle:Stream[Int] = Stream.from(1).map(n => n * (n + 1) / 2)

  def input(filename:String) = {
    val source = Source.fromFile(filename)
    source.mkString.replace("\"", "").split(",").toList
  }
  def wordValue(word:String) = word.toString.map(_.toInt-64).sum

  def main(args:Array[String]) {
    println(input(FILE).map(wordValue).filter(triangle.takeWhile(_<200).contains(_)).length)
  }
}

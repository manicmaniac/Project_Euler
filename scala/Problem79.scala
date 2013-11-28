/*
A common security method used for online banking is to ask the user for three
random characters from a passcode. For example, if the passcode was 531278,
they may ask for the 2nd, 3rd, and 5th characters; the expected reply would be:
317.

The text file, keylog.txt, contains fifty successful login attempts.

Given that the three characters are always asked for in order, analyse the file
so as to determine the shortest possible secret passcode of unknown length.
*/

import scala.io.Source

object Problem79 {
  val FILE = "../resources/keylog.txt"
  def input(file:String) = {
    val source = Source.fromFile(file)
    source.mkString.split("\r\n").toList
  }
  def main(args:Array[String]) {
    val data = input(FILE)
    val used_numbers = data.flatMap(_.toString).distinct.sorted
    val perm_of_keys = used_numbers.permutations.toList
    val key_length = used_numbers.length
    data foreach println
  }
}


/*
Comparing two numbers written in index form like 2^11 and 3^7 is not difficult,
as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.

However, confirming that 632382^518061 > 519432^525806 would be much more
difficult, as both numbers contain over three million digits.

Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file
containing one thousand lines with a base/exponent pair on each line, determine
which line number has the greatest numerical value.

NOTE: The first two lines in the file represent the numbers in the example
given above.
*/

import scala.io.Source

object Problem99 {
  val FILE = "./base_exp.txt"

  val data = Source.fromFile(FILE).mkString.split("\r\n").toList.map(_.split(",").toList.map(_.toInt))

  def main(args:Array[String]) {
    print((data.map(p => p(1) * math.log(p(0))).zipWithIndex.max)._2 + 1)
  }
}

/*
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
*/
object Problem48 {
  def main(args:Array[String]) {
    print((BigInt(1) to 1000 map(p => p pow p.toInt) sum).toString takeRight 10)
  }
}

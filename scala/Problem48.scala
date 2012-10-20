/*
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
*/
object Problem48 {
  def main(args:Array[String]) {
    println((1 to 1000 map(p => BigInt(p) pow p) sum).toString takeRight 10)
  }
}


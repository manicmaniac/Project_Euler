/*
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
each of the digits 0 to 9 in some order, but it also has a rather interesting
sub-string divisibility property.

Let d[1] be the 1^st digit, d[2] be the 2^nd digit, and so on. In this way, we
note the following:

  • d[2]d[3]d[4]=406 is divisible by 2
  • d[3]d[4]d[5]=063 is divisible by 3
  • d[4]d[5]d[6]=635 is divisible by 5
  • d[5]d[6]d[7]=357 is divisible by 7
  • d[6]d[7]d[8]=572 is divisible by 11
  • d[7]d[8]d[9]=728 is divisible by 13
  • d[8]d[9]d[10]=289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.
*/

object Problem43 {
  def isPandigital(n:Long) = n.toString.sorted == "0123456789"
  def main(args:Array[String]) {
    val conditional = {
      for(a <- 100 to 999 by 2;
        b <- 0 to 9; if((a.toString.tail + b.toString).toInt % 3 == 0);
        c <- 0 to 9; if((a.toString.last + b.toString + c.toString).toInt % 5 == 0);
        d <- 0 to 9; if((b * 100 + c * 10 + d) % 7 == 0);
        e <- 0 to 9; if((c * 100 + d * 10 + e) % 11 == 0);
        f <- 0 to 9; if((d * 100 + e * 10 + f) % 13 == 0);
        g <- 0 to 9; if((e * 100 + f * 10 + g) % 17 == 0);
        i <- 1 to 9; if(isPandigital((i.toString + a.toString + b.toString + c.toString + d.toString + e.toString + f.toString + g.toString).toLong))
      ) yield {
        (List(i, a, b%100%10, c%100%10, d%100%10, e%100%10, f%100%10, g%100%10).mkString).toLong
      }
    }
    println(conditional sum)
  }
}

